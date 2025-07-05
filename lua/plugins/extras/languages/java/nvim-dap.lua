local get_executable = require("utils.executable").get_executable

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      opts = function(_, opts) ---@cast opts NvimJdtlsOpts
        local debug_bundle = get_executable("com.microsoft.java.debug.plugin.jar", "share/java-debug-adapter")
        if not debug_bundle then
          return opts
        end

        opts = opts or {}
        opts.lspconfig = opts.lspconfig or {}
        opts.lspconfig.init_options = opts.lspconfig.init_options or {}
        opts.lspconfig.init_options.bundles = opts.lspconfig.init_options.bundles or {}

        ---@diagnostic disable-next-line: param-type-mismatch
        table.insert(opts.lspconfig.init_options.bundles, debug_bundle)

        return opts
      end,
    },
  },
}
