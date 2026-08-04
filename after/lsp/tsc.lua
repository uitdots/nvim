local lsp_utils = require("utils.lsp")

---@module 'lspconfig'
---@type _.lspconfig.settings.vtsls.Typescript.InlayHints | _.lspconfig.settings.vtsls.Javascript.InlayHints
local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("tsc") then
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

local semantic_tokens_enabled = lsp_utils.is_semantic_tokens_enabled("tsc")

-- We take from: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tsgo.lua
-- Until this is closed: https://github.com/neovim/nvim-lspconfig/issues/4467
---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "tsc"
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_dir = function(bufnr, on_dir)
    local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
    root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } } or vim.list_extend(root_markers, { ".git" })

    local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
    local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
    local project_root = vim.fs.root(bufnr, root_markers)
    if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
      return
    end
    if deno_root and (not project_root or #deno_root >= #project_root) then
      return
    end
    on_dir(project_root or vim.fn.getcwd())
  end,
  on_init = function(client)
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
