local lsp_utils = require("utils.lsp")

local semantic_tokens_enabled = lsp_utils.is_semantic_tokens_enabled("lua_ls")

---@type vim.lsp.Config
return {
  ---@module 'codesettings'
  ---@type lsp.lua_ls
  settings = {
    Lua = {
      semantic = {
        enable = semantic_tokens_enabled,
      },
      hint = {
        enable = lsp_utils.is_inlay_hint_enabled("lua_ls"),
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
