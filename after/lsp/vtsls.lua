local inlayhint_opts = {
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
