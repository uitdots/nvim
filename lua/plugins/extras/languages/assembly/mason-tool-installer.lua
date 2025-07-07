---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "asm-lsp",
      "asmfmt",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
