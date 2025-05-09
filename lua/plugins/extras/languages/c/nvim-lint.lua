---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.c = {
      "cpplint",
    }
    lint.linters_by_ft.cpp = {
      "cpplint",
    }
  end,
}
