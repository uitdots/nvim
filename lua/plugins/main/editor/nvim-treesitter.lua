---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufReadPost",
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
      "just",
      "markdown_inline",
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = function()
        -- Disable for chezmoi template file: https://github.com/alker0/chezmoi.vim#-can-i-use-nvim-treesitter-for-my-chezmoi-template
        if string.find(vim.bo.filetype, "chezmoitmpl") then
          return true
        end
      end,
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
  config = function(_, opts)
    vim.treesitter.language.register("bash", "dotenv")
    require("nvim-treesitter.configs").setup(opts)
  end,
}
