local command = vim.api.nvim_create_user_command
local filter_availabled_external = require("preferences").options.others.filter_availabled_external
local is_executable = require("utils.executable").is_executable_cache

local ignore_format_patterns = {
  "/node_modules/",
}

---@param opts conform.setupOpts
local function filter_available(opts)
  for filetype, formatters in pairs(opts.formatters_by_ft) do
    ---@cast formatters string[]
    opts.formatters_by_ft[filetype] = function(bufnr)
      return vim.tbl_filter(function(formatter)
        return require("conform").get_formatter_info(formatter, bufnr).available
      end, formatters)
    end
  end
end

---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>lf",
      "<cmd>Format<cr>",
      desc = "LSP | Format",
      silent = true,
    },
    {
      "<leader>lF",
      "<cmd>FormatToggle!<cr>",
      desc = "LSP | Toggle Autoformat",
      silent = true,
    },
  },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      prettier = {
        append_args = {
          "--ignore-gitignore",
        },
      },
      injected = {
        options = {
          lang_to_formatters = {
            json = is_executable("jq") and { "jq" } or nil,
          },
        },
      },
    },
    format_after_save = function(bufnr)
      if not vim.g.auto_format_enabled or vim.b[bufnr].auto_format_enabled == false then
        return
      end
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      for _, pattern in ipairs(ignore_format_patterns) do
        if bufname:match(pattern) then
          vim.b[bufnr].auto_format_enabled = false
          return
        end
      end
      return {}
    end,
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
      vim.notify("Format Done", vim.log.levels.INFO, { title = "Format" })
    end, { nargs = "*", desc = "Code Format", range = true })

    command("FormatDisable", function(args)
      if args.bang then
        vim.g.auto_format_enabled = false
        vim.notify("Autoformat Disabled", vim.log.levels.INFO, { title = "Format", id = "auto_format" })
      else
        vim.b.auto_format_enabled = false
        vim.notify("Autoformat Disabled (Local)", vim.log.levels.INFO, { title = "Format", id = "local_auto_format" })
      end
    end, { desc = "Disable Autoformat", bang = true })

    command("FormatEnable", function(args)
      if args.bang then
        vim.g.auto_format_enabled = true
        vim.notify("Autoformat Enabled", vim.log.levels.INFO, { title = "Format", id = "auto_format" })
      else
        vim.b.auto_format_enabled = true
        vim.notify("Autoformat Enabled (Local)", vim.log.levels.INFO, { title = "Format", id = "local_auto_format" })
      end
    end, { desc = "Enable Autoformat", bang = true })

    command("FormatToggle", function(args)
      if args.bang then
        if vim.g.auto_format_enabled then
          vim.cmd("FormatDisable!")
        else
          vim.cmd("FormatEnable!")
        end
      else
        if vim.b.auto_format_enabled then
          vim.cmd("FormatDisable")
        else
          vim.cmd("FormatEnable")
        end
      end
    end, { desc = "Toggle Autoformat", bang = true })
  end,
  config = function(_, opts)
    if filter_availabled_external then
      filter_available(opts)
    end

    require("conform").setup(opts)
  end,
}
