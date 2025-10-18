---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "nvim-neotest/neotest-jest",
      specs = {
        {
          "nvim-neotest/neotest",
          opts = function(_, opts)
            opts = opts or {}
            opts.adapters = opts.adapters or {}
            ---@module 'neotest-jest'
            ---@type neotest.JestOptions
            local test_opts = {
              jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")),
            }
            table.insert(opts.adapters, require("neotest-jest")(test_opts))
            return opts
          end,
        },
      },
    },
  },
  optional = true,
}
