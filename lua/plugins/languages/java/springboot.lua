---@type LazySpec
return {
  "elmcgill/springboot-nvim",
  cmd = "SpringBootNewProject",
  keys = {
    {
      "<localleader>js",
      function()
        require("springboot-nvim").boot_run()
      end,
      desc = "Java | Boot Run",
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
  config = true,
  dependencies = "mfussenegger/nvim-jdtls",
}
