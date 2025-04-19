---@type NvPluginSpec
return {
  "Kaiser-Yang/blink-cmp-git",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      {
        "saghen/blink.cmp",
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
      },
    },
  },
}
