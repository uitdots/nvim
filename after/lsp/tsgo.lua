local lsp = require("configs.lsp")
local lsp_utils = require("utils.lsp")

---@module 'codesettings'
---@type lsp.vtsls.InlayHints
local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("tsgo") then
  inlayhint_opts = {
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
end

local semantic_tokens_enabled = lsp_utils.is_semantic_tokens_enabled("tsgo")

---@type vim.lsp.Config
return {
  on_init = function(client, init_result)
    lsp.on_init(client, init_result)

    if not semantic_tokens_enabled then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
  ---@type lsp.vtsls
  settings = {
    javascript = {
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
