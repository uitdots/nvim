-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  enabled = true,
  keys = {
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Debug | Continue",
      silent = true,
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Debug | Step Over",
      silent = true,
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Debug | Step Into",
      silent = true,
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Debug | Step Out",
      silent = true,
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug | Breakpoint",
      silent = true,
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug | Breakpoint Condition",
      silent = true,
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Debug | Run Last",
      silent = true,
    },
  },
  config = function()
    require("configs.dap.javascripts-node").setup()
  end,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      optional = true,
    },
  },
}
