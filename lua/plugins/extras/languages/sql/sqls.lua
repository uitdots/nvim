local lsp = require("configs.lsp")
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "nanotee/sqls.nvim",
  ft = "sql",
  cond = is_executable("sqls"),
  config = function()
    require("lspconfig").sqls.setup({
      on_attach = require("sqls").on_attach,
      on_init = lsp.on_init,
      capabilities = lsp.capabilities,
    })
  end,
}
