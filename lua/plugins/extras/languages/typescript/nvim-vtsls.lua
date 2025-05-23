local filter_availabled_external = UitVim.config.filter_availabled_external
local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "yioneko/nvim-vtsls",
  enabled = not filter_availabled_external or is_executable("vtsls"),
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
}
