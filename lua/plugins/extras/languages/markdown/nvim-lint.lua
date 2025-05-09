---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.markdown = {
      "markdownlint",
    }
  end,
}
