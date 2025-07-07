---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local lint = require("lint")

    local fts = { "bash", "sh" }

    for _, ft in ipairs(fts) do
      lint.linters_by_ft[ft] = {
        "shellcheck",
      }
    end
  end,
  optional = true,
}
