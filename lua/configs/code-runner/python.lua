local is_executable = require("utils.executable").is_executable_cache

return {
  default = is_executable("python3") and "python3 %" or "python %",
}
