---@type LazySpec
return {
  "mfussenegger/nvim-jdtls",
  specs = {
    {
      "mfussenegger/nvim-dap",
      keys = {
        {
          "<localleader>jt",
          function()
            require("jdtls").pick_test()
          end,
          ft = "java",
          desc = "Java | Pick Test",
          silent = true,
        },
      },
      opts = function()
        require("jdtls").setup_dap()
      end,
      optional = true,
    },
  },
}
