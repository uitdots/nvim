local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "yioneko/nvim-vtsls",
  enabled = is_executable("vtsls"),
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
}
