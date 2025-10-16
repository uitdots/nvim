---@type LazySpec
return {
  "nvim-neotest/neotest",
  sepc = {
    {
      "fredrikaverpil/neotest-golang",
      version = "*",
      specs = {
        {
          "nvim-neotest/neotest",
          ---@type PluginsOpts.NeotestOpts
          ---@diagnostic disable-next-line: missing-fields
          opts = {
            adapters = {
              ["neotest-golang"] = false,
            },
          },
        },
      },
    },
  },
  optional = true,
}
