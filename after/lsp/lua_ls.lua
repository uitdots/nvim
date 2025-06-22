---@diagnostic disable: missing-fields

local lsp_utils = require("utils.lsp")

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      hint = {
        enable = lsp_utils.is_inlay_hint_enabled("lua_ls"),
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        checkThirdParty = false,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
