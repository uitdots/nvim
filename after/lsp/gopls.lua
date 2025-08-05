---@diagnostic disable: missing-fields

local lsp_utils = require("utils.lsp")

local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("gopls") then
  inlayhint_opts = {
    assignVariableTypes = true,
    compositeLiteralFields = true,
    compositeLiteralTypes = true,
    constantValues = true,
    functionTypeParameters = true,
    parameterNames = true,
    rangeVariableTypes = true,
  }
end

local semantic_tokens_enabled = lsp_utils.is_semantic_tokens_enabled("gopls")

---@type vim.lsp.Config
return {
  on_attach = function(client)
    -- Idk I got from https://github.com/golang/go/issues/54531#issuecomment-1464982242
    if semantic_tokens_enabled and not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens
      if semantic ~= nil then
        client.server_capabilities.semanticTokensProvider = {
          full = true,
          legend = {
            tokenTypes = semantic.tokenTypes,
            tokenModifiers = semantic.tokenModifiers,
          },
          range = true,
        }
      end
    end
  end,
  settings = {
    gopls = {
      hints = inlayhint_opts,
      semanticTokens = true,
    },
  },
}
