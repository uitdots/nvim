if require("utils.executable").is_executable_cache("jq") then
  vim.bo.formatexpr = ""
  vim.bo.formatprg = "jq"
end
