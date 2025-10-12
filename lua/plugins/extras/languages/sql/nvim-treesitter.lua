---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@type PluginsOpts.TSConfig
  opts = {
    ensure_installed = {
      "sql",
    },
    highlight = {
      disable = {
        pgsql = true,
      }
    }
  },
  opts_extend = {
    "ensure_installed",
  },
}
