---@diagnostic disable: missing-fields

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.pyright
  settings = {
    python = {
      analysis = {
        -- If use ruff, uncomment, but
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
      },
      typeshedPath = vim.fn.stdpath("data") .. "/lazy/typeshed",
    },
    pyright = {
      -- If use Ruff's import organizer, uncomment
      disableOrganizeImports = true,
    },
  },
}
