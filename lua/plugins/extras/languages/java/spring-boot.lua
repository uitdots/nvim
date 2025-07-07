---@type LazySpec
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
