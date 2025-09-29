---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "c",
      "cmake",
      "cpp",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
