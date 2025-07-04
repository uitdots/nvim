local filter_availabled_external = require("uitvim").options.filter_availabled_external

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

---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = {
    "BufRead",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>lf",
      "<cmd>Format<cr>",
      desc = "LSP | Format",
      silent = true,
    },
    {
      "<leader>lF",
      "<cmd>FormatToggle<cr>",
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
      if not vim.g.autoformat_enabled or vim.b[bufnr].autoformat_enabled == false then
        return
      end
      -- Disable autoformat for files in a certain path
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
