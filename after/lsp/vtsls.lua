---@diagnostic disable: missing-fields
---@module 'neoconf'

local lsp = require("configs.lsp")
local lsp_utils = require("utils.lsp")

---@type _.lspconfig.settings.vtsls.InlayHints
local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("vtsls") then
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

local semantic_tokens_enabled = lsp_utils.is_semantic_tokens_enabled("vtsls")

---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local deno_config = vim.fs.dirname(vim.fs.find({
      "deno.json",
      "deno.jsonc",
    }, { path = fname, upward = true })[1])
    if deno_config then
      return
    end
    on_dir()
  end,
  on_init = function(client, init_result)
    lsp.on_init(client, init_result)

    if not semantic_tokens_enabled then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
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
