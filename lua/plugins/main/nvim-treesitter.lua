---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "VeryLazy",
    "BufRead",
    "BufNewFile",
  },
  cmd = {
    "TSInstall",
    "TSUninstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
    "TSToggle",
    "TSBufToggle",
  },
  ---@module 'nvim-treesitter'
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      "vimdoc",
      "markdown_inline",
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gsn",
        node_incremental = "gsi",
        node_decremental = "gsd",
        scope_incremental = "gss",
      },
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  init = function()
    vim.treesitter.language.register("groovy", "jenkins")
    vim.treesitter.language.register("bash", "dotenv")
    vim.treesitter.language.register("bash", "zsh")
  end,
  main = "nvim-treesitter.configs",
}
