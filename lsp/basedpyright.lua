return {
  settings = {
    basedpyright = {
      -- If use Ruff's import organizer, uncomment
      disableOrganizeImports = true,
      analysis = {
        -- If use ruff, uncomment
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
        typeshedPath = vim.fn.stdpath("data") .. "/lazy/typeshed",
      },
    },
  },
}
