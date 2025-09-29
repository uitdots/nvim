local is_executable = require("utils.executable").is_executable_cache
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  enabled = is_executable("tree-sitter"),
  lazy = vim.fn.argc(-1) == 0, -- load early when opening file (LazyVim)
  build = ":TSUpdate",
  event = {
    "VeryLazy",
    "BufRead",
    "BufNewFile",
  },
  cmd = {
    "TSInstall",
    "TSInstallFromGrammar",
    "TSLog",
    "TSUninstall",
    "TSUpdate",
  },
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "vimdoc",
      "markdown_inline",
    },
    indent = {
      enabled = true,
      disable = {
        dart = true,
        yaml = true,
      },
    },
    highlight = {
      enabled = true,
    },
    fold = {
      enabled = true,
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  ---@param opts PluginsOpts.TSConfig
  config = function(_, opts)
    local ts = require("nvim-treesitter")
    ts.setup(opts)
    ts.install(opts.ensure_installed)

    opts.highlight.disable = opts.highlight.disable or {}
    opts.indent.disable = opts.indent.disable or {}
    opts.fold.disable = opts.fold.disable or {}

    local group = augroup("treesitter", {})

    autocmd("FileType", {
      desc = "Enable treesitter highlighting",
      callback = function(args)
        local buf = args.buf
        local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
        if opts.highlight.enabled and not opts.highlight.disable[filetype] then
          pcall(vim.treesitter.start)
        end
        if opts.indent.enabled and not opts.indent.disable[filetype] then
          vim.bo[buf].autoindent = false
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        if opts.fold.enabled and not opts.fold.disable[filetype] then
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
      end,
      group = group,
    })
  end,
}
