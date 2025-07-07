---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "roslyn",
      "rzls",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  optional = true,
}
