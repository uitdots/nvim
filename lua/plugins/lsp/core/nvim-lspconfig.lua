---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = function()
    require("configs.lspconfig").defaults()

    local servers = {
      -- NOTE: Add line by line the lsp you want to enable manually here.
      -- Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
    }
    vim.lsp.enable(servers)
  end,
}
