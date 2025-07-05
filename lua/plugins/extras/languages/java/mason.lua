local get_executable = require("utils.executable").get_executable

---@type NvPluginSpec
return {
  "mason-org/mason.nvim",
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      opts = function(_, opts) ---@cast opts NvimJdtlsOpts
        local lombok_bundle = get_executable("lombok.jar", "share/lombok-nightly")
        if not lombok_bundle then
          return opts
        end

        opts = opts or {}
        opts.lspconfig = opts.lspconfig or {}
        opts.lspconfig.init_options = opts.lspconfig.init_options or {}
        opts.lspconfig.init_options.bundles = opts.lspconfig.init_options.bundles or {}

        ---@diagnostic disable-next-line: param-type-mismatch
        table.insert(opts.lspconfig.init_options.bundles, lombok_bundle)

        return opts
      end,
    },
  },
  optional = true,
}
