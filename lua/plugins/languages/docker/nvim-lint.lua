---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.dockerfile = {
      "hadolint",
    }
  end,
  optional = true,
}
