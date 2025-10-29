---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "thenbe/neotest-playwright",
      specs = {
        {
          "nvim-neotest/neotest",
          opts = function(_, opts)
            opts = opts or {}
            opts.adapters = opts.adapters or {}
            opts.consumers = opts.consumers or {}

            local adapter_opts = {
              options = {
                persist_project_selection = true,
                enable_dynamic_test_discovery = true,
              },
            }
            table.insert(opts.adapters, require("neotest-playwright").adapter(adapter_opts))

            opts.consumers.playwright = require("neotest-playwright.consumers").consumers
            return opts
          end,
        },
      },
    },
  },
  optional = true,
}
