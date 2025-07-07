---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function()
    local lint = require("lint")

    lint.linters["npm-groovy-lint"].ignore_exitcode = true

    lint.linters_by_ft.groovy = {
      "npm-groovy-lint",
    }
  end,
}
