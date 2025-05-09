---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      "asm-lsp",
      "asmfmt",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
