---@type LazySpec
return {
  "nvim-neotest/neotest",
  sepc = {
    {
      "nvim-neotest/neotest-jest",
      specs = {
        {
          "nvim-neotest/neotest",
          ---@type PluginsOpts.NeotestOpts
          ---@diagnostic disable-next-line: missing-fields
          opts = {
            adapters = {
              ["neotest-jest"] = function()
                return {
                  jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")),
                }
              end,
            },
          },
        },
      },
    },
  },
  optional = true,
}
