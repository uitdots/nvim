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
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "graphql",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "just",
      "lua",
      "markdown",
      "markdown_inline",
      "powershell",
      "python",
      "regex",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    indent = {
      enable = true,
      disable = {
        "markdown", -- indentation at bullet points is worse
        -- "javascript", -- some wrong indentation when using `o`
        -- "typescript",
        "yaml", -- wrong indentation in list continuation
        "dart", -- dart delay: https://github.com/NvChad/NvChad/issues/2237#issuecomment-1653019941
      },
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
  init = function()
    vim.treesitter.language.register("bash", "dotenv")
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  dependencies = {
    "OXY2DEV/markview.nvim",
    optional = true,
  },
}
