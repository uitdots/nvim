local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "nanotee/sqls.nvim",
  ft = "sql",
  cond = is_executable("sqls"),
  config = function()
    local lspconfig = require("configs.lsp.lspconfig")
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
