---@diagnostic disable: missing-fields

local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.kotlin_language_server
  settings = {
    inlayHints = inlayhint_enabled and {
      typeHints = true,
      parameterHints = true,
      chainedHints = true,
    } or nil,
  },
}
