---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "stylua",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
