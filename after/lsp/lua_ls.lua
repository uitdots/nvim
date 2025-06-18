---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      hint = {
        enable = true,
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
