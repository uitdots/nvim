---@type NvPluginSpec
return {
  "saghen/blink.cmp",
  optional = true,
  ---@type blink.cmp.Config
  opts = {
    sources = {
      per_filetype = {
        gitcommit = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "git",
        },
      },
      providers = {
        git = {
          module = "blink-cmp-git",
          name = "Git",
          --- @module 'blink-cmp-git'
          --- @type blink-cmp-git.Options
          opts = {},
        },
      },
    },
  },
  dependencies = {
    "Kaiser-Yang/blink-cmp-git",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
