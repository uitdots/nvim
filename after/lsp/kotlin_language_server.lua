local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
return {
  settings = {
    inlayHints = inlayhint_enabled and {
      typeHints = true,
      parameterHints = true,
      chainedHints = true,
    } or nil,
  },
}
