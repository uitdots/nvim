---@type NvPluginSpec
return {
  "nanotee/sqls.nvim",
  ft = "sql",
  config = function()
    require("lspconfig").sqls.setup({
      on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
        require("configs.lspconfig").on_attach(client, bufnr)
      end,
    })
  end,
}
