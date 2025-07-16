local get_executable = require("utils.executable").get_executable

---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      ---@type PluginsOpts.NvimJdtlsOpts
      opts = {
        bundles = {
          function()
            return get_executable("com.microsoft.java.test.plugin.jar", { masons = "share/java-test" })
          end,
        },
      },
      opts_extend = {
        "bundles",
      },
    },
  },
  optional = true,
}
