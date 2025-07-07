---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  -- Because we should use eslint lsp :P
  --[[
  opts = function()
    local lint = require("lint")

    local fts = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

    for _, ft in ipairs(fts) do
      lint.linters_by_ft[ft] = {
        "eslint",
      }
    end
  end,
  ]]
}
