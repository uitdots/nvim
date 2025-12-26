local filter_available_external = require("preferences").options.others.filter_available_external
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "yioneko/nvim-vtsls",
  enabled = not filter_available_external or is_executable("vtsls"),
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
}
