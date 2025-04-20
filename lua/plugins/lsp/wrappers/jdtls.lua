local is_executable = require("core.utils").is_executable

---@type NvPluginSpec
return {
  "mfussenegger/nvim-jdtls",
  cond = is_executable("jdtls"),
  ft = "java",
}
