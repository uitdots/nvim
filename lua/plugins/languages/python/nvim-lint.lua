---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local lint = require("lint")

    -- Usig ruff lsp is faster
    lint.linters_by_ft.python = {
      -- "ruff",
    }
  end,
  optional = true,
}
