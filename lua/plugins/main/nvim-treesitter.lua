-- NOTE: Reference config from https://github.com/MeanderingProgrammer/treesitter-modules.nvim

local is_executable = require("utils.executable").is_executable_cache
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local bo = vim.bo

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

    local treesitter = vim.treesitter
    local vim_ts_language = treesitter.language
    local vim_ts_query_get = treesitter.query.get

    local group = augroup("treesitter", {})
    local installed_parsers = {}
    for _, v in ipairs(ts.get_installed("parsers")) do
      installed_parsers[v] = true
    end

    autocmd("FileType", {
      desc = "Enable treesitter highlighting",
      callback = function(args)
        local buf = args.buf
        local filetype = args.match
        local language = vim_ts_language.get_lang(filetype) or filetype
        if not (vim_ts_language.add(language) and installed_parsers[language]) then
          return
        end
        if opts.highlight.enabled and not opts.highlight.disable[language] and vim_ts_query_get(language, "highlights") then
          treesitter.start(buf, language)
        end
        if opts.indent.enabled and not opts.indent.disable[language] and vim_ts_query_get(language, "indents") then
          bo[buf].autoindent = false
          bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        if opts.fold.enabled and not opts.fold.disable[language] and vim_ts_query_get(language, "folds") then
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
      end,
      group = group,
    })
  end,
}
