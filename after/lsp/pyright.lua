---@diagnostic disable: missing-fields
---@module 'neoconf'

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
      typeshedPath = string.format("%s/lazy/typeshed", vim.fn.stdpath("data")),
    },
    pyright = {
      -- If use Ruff's import organizer, uncomment
      disableOrganizeImports = true,
    },
  },
}
