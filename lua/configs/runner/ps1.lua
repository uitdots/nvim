local is_executable = require("utils.executable").is_executable_cache

return {
  default = is_executable("pwsh") and "pwsh %" or "powershell %",
}
