---@diagnostic disable: missing-fields

local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      hint = {
        enable = inlayhint_enabled,
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
