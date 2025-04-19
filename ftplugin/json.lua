if vim.fn.executable("jq") == 1 then
  vim.bo.formatexpr = ""
  vim.bo.formatprg = "jq"
end
