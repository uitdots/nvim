local filter_availabled_external = require("preferences").options.others.filter_availabled_external
local ide_mode = require("utils.os").ide_mode

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
  cond = ide_mode,
  event = "VeryLazy",
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
          "--ignore-gitignore", -- Format file which ignored by .gitignore
        },
      },
    },
    format_after_save = function(bufnr) -- Async format
      -- Disable with a global or buffer-local variable
      if not vim.g.auto_format_enabled or vim.b[bufnr].auto_format_enabled == false then
        return
      end
      -- Disable auto_format for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") then
        return
      end
      return {}
    end,
  },
  config = function(_, opts)
    if filter_availabled_external then
      filter_available(opts)
    end

    require("conform").setup(opts)
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
