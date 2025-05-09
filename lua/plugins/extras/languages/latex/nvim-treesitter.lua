---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      -- TODO: What, latex use what?
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
