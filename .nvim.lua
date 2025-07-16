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
      ---@diagnostic disable-next-line: missing-fields
      workspace = {
        -- library = vim.api.nvim_get_runtime_file("", true), -- IDK this is legit but maybe we have lazydev already
        checkThirdParty = false,
      },
    },
  },
}

vim.lsp.config("lua_ls", lua_ls_setting)
