local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "mfussenegger/nvim-jdtls",
  cond = is_executable("jdtls"),
  ft = "java",
}
