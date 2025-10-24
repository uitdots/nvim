---@type vim.lsp.Config
return {
  ---@module 'codesettings'
  ---@type lsp.basedpyright
  settings = {
    basedpyright = {
      -- If use Ruff's import organizer, uncomment
      disableOrganizeImports = true,
      analysis = {
        -- If use ruff, uncomment
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
        typeshedPath = string.format("%s/lazy/typeshed", vim.fn.stdpath("data")),
      },
    },
  },
}
