local filter_availabled_external = require("preferences").options.others.filter_availabled_external
local is_executable = require("utils.executable").is_executable

---@type LazySpec
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
