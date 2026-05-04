local lsp = require("configs.lsp")
local lsp_utils = require("utils.lsp")

---@module 'lspconfig'
---@type _.lspconfig.settings.vtsls.Typescript.InlayHints | _.lspconfig.settings.vtsls.Javascript.InlayHints
local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("tsgo") then
  inlayhint_opts = {
    parameterNames = {
      enabled = "all",
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
  ---@module 'lspconfig'
  ---@type lspconfig.settings.vtsls
  settings = {
    javascript = {
      ---@cast inlayhint_opts _.lspconfig.settings.vtsls.Javascript.InlayHints
      inlayHints = inlayhint_opts,
      -- referencesCodeLens = {
      --   enabled = true,
      --   showOnAllFunctions = true,
      -- },
    },
    typescript = {
      -- referencesCodeLens = {
      --   enabled = true,
      --   showOnAllFunctions = true,
      -- },
      -- implementationsCodeLens = {
      --   enabled = true,
      --   showOnAllClassMethods = true,
      --   showOnInterfaceMethods = true,
      -- },
      ---@cast inlayhint_opts _.lspconfig.settings.vtsls.Typescript.InlayHints
      inlayHints = inlayhint_opts,
    },
  },
}
