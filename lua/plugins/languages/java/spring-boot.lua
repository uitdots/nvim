---@type LazySpec
return {
  "JavaHello/spring-boot.nvim",
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      ---@type PluginsOpts.NvimJdtlsOpts
      opts = {
        bundles = {
          function()
            return require("spring_boot").java_extensions()
          end,
        },
      },
      opts_extend = {
        "bundles",
      },
      dependencies = "JavaHello/spring-boot.nvim",
    },
  },
}
