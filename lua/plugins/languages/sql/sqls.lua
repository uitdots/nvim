local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "nanotee/sqls.nvim",
  ft = "sql",
  cond = is_executable("sqls"),
  config = function()
    vim.lsp.config("sqls", {
      on_attach = require("sqls").on_attach,
    })
  end,
}
