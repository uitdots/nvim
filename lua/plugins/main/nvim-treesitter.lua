-- NOTE: Reference config from https://github.com/MeanderingProgrammer/treesitter-modules.nvim

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
      disable = {},
    },
    fold = {
      enabled = true,
      disable = {},
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
        local filetype = args.match
        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not vim.treesitter.language.add(language) then
          return
        end
        if opts.highlight.enabled and not opts.highlight.disable[language] then
          vim.treesitter.start(buf, language)
        end
        if opts.indent.enabled and not opts.indent.disable[language] then
          vim.bo[buf].autoindent = false
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        if opts.fold.enabled and not opts.fold.disable[language] then
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
      end,
      group = group,
    })
  end,
}
