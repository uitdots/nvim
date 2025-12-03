---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function()
    require("lint").linters_by_ft["yaml.openapi"] = {
      "spectral",
    }
  end,
}
