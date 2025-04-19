---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = function()
    require("configs.lspconfig").defaults()

    local servers = { "html", "cssls" }
    vim.lsp.enable(servers)
  end,
}
