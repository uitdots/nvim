---@module 'blink-cmp'

---@type NvPluginSpec
return {
  "Kaiser-Yang/blink-cmp-git",
  enabled = true,
  ft = "gitcommit",
  specs = {
    {
      "saghen/blink.cmp",
      ---@type blink.cmp.Config
      opts = {
        sources = {
          per_filetype = {
            gitcommit = {
              inherit_defaults = true,
              "git",
            },
          },
          providers = {
            git = {
              module = "blink-cmp-git",
              name = "Git",
              --- @module 'blink-cmp-git'
              --- @type blink-cmp-git.Options
              opts = nil,
            },
          },
        },
      },
    },
  },
  dependencies = {
    "saghen/blink.cmp",
    "nvim-lua/plenary.nvim",
  },
}
