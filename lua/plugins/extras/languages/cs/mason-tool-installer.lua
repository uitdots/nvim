local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      is_windows and "omnisharp" or "omnisharp-mono",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
}
