---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      -- "marksman",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
