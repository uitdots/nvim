---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "go",
      "gomod",
      "gosum",
      "gowork",
      "gotmpl",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
