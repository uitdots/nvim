local M = {}

function M.setup()
  require("nvchad.lsp").diagnostic_config()

  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
  })
end

return M
