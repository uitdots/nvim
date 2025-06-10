local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled
local inlayhint_opts = inlayhint_enabled
    and {
      bindingModeHints = { enable = true },
      chainingHints = { enable = true },
      closingBraceHints = { enable = true },
      closureCaptureHints = { enable = true },
      closureReturnTypeHints = { enable = true },
      closureStyle = "impl_fn",
      discriminantHints = { enable = true },
      expressionAdjustmentHints = { enable = true },
      genericParameterHints = {
        const = { enable = true },
        lifetime = { enable = true },
        type = { enable = true },
      },
      implicitDrops = { enable = true },
      implicitSizedBoundHints = { enable = true },
      lifetimeElisionHints = { enable = true, useParameterNames = true },
      parameterHints = { enable = true },
      rangeExclusiveHints = { enable = true },
      reborrowHints = { enable = true },
      renderColons = true,
      typeHints = {
        enable = true,
        hideClosureInitialization = false,
        hideClosureParameter = false,
        hideNamedConstructor = false,
      },
    }
  or nil

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
return {
  settings = {
    inlayHints = inlayhint_opts,
  },
}
