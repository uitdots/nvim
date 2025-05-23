local inlayhint_enabled = UitVim.config.lsp_inlayhint_enabled
local inlayhint_opts = inlayhint_enabled
    and {
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
    }
  or nil

---@type vim.lsp.Config
---@diagnostic disable-next-line: missing-fields
return {
  settings = {
    javascript = {
      preferences = {
        importModuleSpecifier = "non-relative", ---@type "shortest" | "project-relative" | "relative" | "non-relative"
      },
      inlayHints = inlayhint_opts,
    },
    typescript = {
      preferences = {
        importModuleSpecifier = "non-relative", ---@type "shortest" | "project-relative" | "relative" | "non-relative"
      },
      inlayHints = inlayhint_opts,
    },
  },
}
