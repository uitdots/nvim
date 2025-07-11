---@module 'neoconf'
---@type vim.lsp.Config
local lua_ls_setting = {
  ---@type lspconfig.settings.lua_ls
  settings = {
    ---@diagnostic disable-next-line: missing-fields
    Lua = {
      ---@diagnostic disable-next-line: missing-fields
      diagnostics = {
        ---@diagnostic disable-next-line: missing-fields
        globals = {
          "vim",
        },
      },
    },
  },
}

vim.lsp.config("lua_ls", lua_ls_setting)
