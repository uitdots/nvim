-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

---@type LazySpec
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
      "<leader>dC",
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Debug | Clear Breakpoints",
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
      "<leader>dD",
      function()
        require("dap").disconnect()
      end,
      desc = "Debug | Disconnect",
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
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Debug | Evaluate",
    },
    {
      "<leader>dg",
      function()
        require("dap").goto_()
      end,
      desc = "Debug | Go to Line (No Execute)",
    },
    {
      "<leader>dj",
      function()
        require("dap").down()
      end,
      desc = "Debug | Down",
    },
    {
      "<leader>dk",
      function()
        require("dap").up()
      end,
      desc = "Debug | Up",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Debug | Pause",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Debug | Toggle REPL",
    },
    {
      "<leader>ds",
      function()
        require("dap").session()
      end,
      desc = "Debug | Session",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Debug | Terminate",
    },
    {
      "<leader>dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Debug | Widgets",
    },
  },
  ---This plugin doesn't have setup
  config = function() end,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      optional = true,
    },
    {
      "stevearc/overseer.nvim",
      optional = true,
    },
  },
}
