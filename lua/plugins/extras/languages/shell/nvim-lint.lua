---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function()
    local lint = require("lint")

    local fts = { "bash", "sh" }

    for _, ft in ipairs(fts) do
      lint.linters_by_ft[ft] = {
        "shellcheck",
      }
    end
  end,
}
