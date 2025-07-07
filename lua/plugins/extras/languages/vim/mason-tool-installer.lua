---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "vim-language-server",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
