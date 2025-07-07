---@type LazySpec
return {
  "nvim-neotest/neotest",
  ---@type PluginsOpts.NeotestOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    adapters = {
      ["neotest-vitest"] = false,
      ["neotest-jest"] = function()
        return {
          jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")),
        }
      end,
    },
  },
  dependencies = {
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },
  optional = true,
}
