---@type LazySpec
return {
  "nvim-neotest/neotest",
  ---@type PluginsOpts.NeotestOpts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    adapters = {
      ["neotest-golang"] = false,
    },
  },
  dependencies = {
    "fredrikaverpil/neotest-golang",
    version = "*",
  },
  optional = true,
}
