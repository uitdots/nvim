---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function()
    local lint = require("lint")

    -- Usig ruff lsp is faster
    lint.linters_by_ft.python = {
      -- "ruff",
    }
  end,
}
