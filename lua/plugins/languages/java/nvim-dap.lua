local get_executable = require("utils.executable").get_executable

---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      ---@type PluginsOpts.NvimJdtlsOpts
      opts = {
        bundles = {
          function()
            return get_executable("com.microsoft.java.debug.plugin.jar", { masons = "share/java-debug-adapter" })
          end,
        },
      },
      opts_extend = {
        "bundles",
      },
    },
  },
}
