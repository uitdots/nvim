---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    -- TODO: What should I install?
    ensure_installed = {},
  },
  opts_extend = {
    "ensure_installed",
  },
}
