---@type NvPluginSpec
return {
  "nanotee/sqls.nvim",
  ft = "sql",
  cond = vim.fn.executable("sqls") == 1,
  config = function()
    local lspconfig = require("configs.lspconfig")
    require("lspconfig").sqls.setup({
      on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
        lspconfig.on_attach(client, bufnr)
      end,
      on_init = lspconfig.on_init,
      capabilities = lspconfig.capabilities,
    })
  end,
}
