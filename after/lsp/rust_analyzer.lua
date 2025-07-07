---@diagnostic disable: missing-fields
---@module 'neoconf'

local lsp_utils = require("utils.lsp")

---@type _.lspconfig.settings.rust_analyzer.InlayHints
local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("rust_analyzer") then
  inlayhint_opts = {
    bindingModeHints = { enable = true },
    chainingHints = { enable = true },
    closingBraceHints = { enable = true },
    closureCaptureHints = { enable = true },
    closureReturnTypeHints = { enable = "always" },
    closureStyle = "impl_fn",
    discriminantHints = { enable = "always" },
    expressionAdjustmentHints = { enable = "always" },
    genericParameterHints = {
      const = { enable = true },
      lifetime = { enable = true },
      type = { enable = true },
    },
    implicitDrops = { enable = true },
    implicitSizedBoundHints = { enable = true },
    lifetimeElisionHints = { enable = "always", useParameterNames = true },
    parameterHints = { enable = true },
    rangeExclusiveHints = { enable = true },
    reborrowHints = { enable = "always" },
    renderColons = true,
    typeHints = {
      enable = true,
      hideClosureInitialization = false,
      hideClosureParameter = false,
      hideNamedConstructor = false,
    },
  }
end

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.rust_analyzer
  settings = {
    inlayHints = inlayhint_opts,
  },
}
