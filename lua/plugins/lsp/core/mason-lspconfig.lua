-- TODO: Do I need to check if mason has that's lsp (which neovim support but mason lspconfig hasn't?)

local exclude_servers = vim.list_extend({}, require("uitvim").old_lsps)
vim.list_extend(exclude_servers, require("uitvim").no_setup_lsps)

---@type NvPluginSpec
return {
  "mason-org/mason-lspconfig.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  ---@module 'mason-lspconfig'
  ---@type MasonLspconfigSettings
  opts = {
    automatic_enable = {
      exclude = exclude_servers,
    },
  },
}
