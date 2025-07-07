---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.c = {
      "cpplint",
    }
    lint.linters_by_ft.cpp = {
      "cpplint",
    }
  end,
  optional = true,
}
