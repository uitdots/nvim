---@type NvPluginSpec
return {
  "nvim-neotest/neotest",
  ---@module 'neotest'
  ---@type neotest.Config
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
