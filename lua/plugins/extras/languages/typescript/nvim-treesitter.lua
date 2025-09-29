---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "javascript",
      "typescript",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
