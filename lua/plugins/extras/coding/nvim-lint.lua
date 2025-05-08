---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  enabled = true,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.gitcommit = {
      "commitlint",
    }

    lint.linters_by_ft["*"] = {
      "cspell",
    }
  end,
  config = function()
    require("configs.editor.nvim-lint").setup()
  end,
}
