local filter_availabled_external = require("uitvim").options.filter_availabled_external
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
