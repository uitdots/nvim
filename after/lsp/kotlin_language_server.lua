---@diagnostic disable: missing-fields

local lsp_utils = require("utils.lsp")

---@type _.lspconfig.settings.kotlin_language_server.InlayHints
local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("kotlin_language_server") then
  inlayhint_opts = {
    typeHints = true,
    parameterHints = true,
    chainedHints = true,
  }
end

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.kotlin_language_server
  settings = {
    inlayHints = inlayhint_opts,
  },
}
