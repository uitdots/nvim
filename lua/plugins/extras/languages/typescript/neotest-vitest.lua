---@type LazySpec
return {
  "nvim-neotest/neotest",
  sepc = {
    {
      "marilari88/neotest-vitest",
      specs = {
        {
          "nvim-neotest/neotest",
          ---@type PluginsOpts.NeotestOpts
          ---@diagnostic disable-next-line: missing-fields
          opts = {
            adapters = {
              ["neotest-vitest"] = false,
            },
          },
        },
      },
    },
  },
  optional = true,
}
