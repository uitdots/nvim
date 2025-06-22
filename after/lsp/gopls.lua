---@diagnostic disable: missing-fields

local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled
local inlayhint_opts = inlayhint_enabled and {
  assignVariableTypes = true,
  compositeLiteralFields = true,
  compositeLiteralTypes = true,
  constantValues = true,
  functionTypeParameters = true,
  parameterNames = true,
  rangeVariableTypes = true,
} or nil

---@type vim.lsp.Config
return {
  settings = {
    gopls = {
      hints = inlayhint_opts,
    },
  },
}
