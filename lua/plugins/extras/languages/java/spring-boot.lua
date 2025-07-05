---@type NvPluginSpec
return {
  "JavaHello/spring-boot.nvim",
  cond = vim.fn.glob("~/.vscode/extensions/vmware.vscode-spring-boot*") ~= "",
  cmd = {
    "SpringBootNewProject",
  },
  keys = {
    {
      "<localleader>js",
      function()
        require("springboot-nvim").boot_run()
      end,
      desc = "Java | Springboot Run Project",
      silent = true,
    },
    {
      "<localleader>jc",
      function()
        require("springboot-nvim").generate_class()
      end,
      desc = "Java | Generate Class",
      silent = true,
    },
    {
      "<localleader>ji",
      function()
        require("springboot-nvim").generate_interface()
      end,
      desc = "Java | Generate Interface",
      silent = true,
    },
    {
      "<localleader>je",
      function()
        require("springboot-nvim").generate_enum()
      end,
      desc = "Java | Generate Enum",
      silent = true,
    },
  },
  main = "springboot-nvim",
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      opts = function(_, opts) ---@cast opts NvimJdtlsOpts
        opts = opts or {}
        opts.lspconfig = opts.lspconfig or {}
        opts.lspconfig.init_options = opts.lspconfig.init_options or {}
        opts.lspconfig.init_options.bundles = opts.lspconfig.init_options.bundles or {}

        ---@diagnostic disable-next-line: param-type-mismatch
        table.insert(opts.lspconfig.init_options.bundles, require("spring_boot").java_extensions())

        return opts
      end,
      dependencies = "JavaHello/spring-boot.nvim",
    },
  },
}
