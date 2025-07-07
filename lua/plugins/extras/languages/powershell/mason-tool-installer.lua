---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "powershell-editor-services",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
