---@module 'blink-cmp'

---@type NvPluginSpec
return {
  "saghen/blink.cmp",
  optional = true,
  ---@type blink.cmp.Config
  opts = {
    sources = {
      per_filetype = {
        gitcommit = {
          "git",
          inherit_defaults = true,
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
  opts_extend = {
    "sources.per_filetype.gitcommit",
  },
  {
    "Kaiser-Yang/blink-cmp-git",
    ft = "gitcommit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
