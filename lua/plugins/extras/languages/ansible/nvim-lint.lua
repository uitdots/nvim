---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.ansible = {
      "ansible_lint",
    }
  end,
  optional = true,
}
