local is_executable = require("utils.executable").is_executable_cache

---@type NvPluginSpec
return {
  "ravitemer/mcphub.nvim",
  cond = is_executable("npm"),
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest",
  main = "mcphub",
}
