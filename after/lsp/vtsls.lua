---@diagnostic disable: missing-fields

local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled
local inlayhint_opts = inlayhint_enabled and {
    parameterNames = {
      enabled = "all", ---@type 'none' | 'literals' | 'all'
    },
    parameterTypes = {
      enabled = true,
    },
    variableTypes = {
      enabled = true,
    },
    propertyDeclarationTypes = {
      enabled = true,
    },
    functionLikeReturnTypes = {
      enabled = true,
    },
    enumMemberValues = {
      enabled = true,
    },
  } or nil

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.vtsls
  settings = {
    javascript = {
      preferences = {
        importModuleSpecifier = "non-relative",
      },
      ---@diagnostic disable-next-line: assign-type-mismatch
      inlayHints = inlayhint_opts,
    },
    typescript = {
      preferences = {
        importModuleSpecifier = "non-relative",
      },
      ---@diagnostic disable-next-line: assign-type-mismatch
      inlayHints = inlayhint_opts,
    },
  },
}
