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
      desc = "Dap | Continue",
      silent = true,
    },
    {
      "<leader>dC",
      function()
        require("dap").clear_breakpoints()
      end,
      desc = "Dap | Clear Breakpoints",
      silent = true,
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Dap | Step Over",
      silent = true,
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Dap | Step Into",
      silent = true,
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Dap | Step Out",
      silent = true,
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Dap | Breakpoint",
      silent = true,
    },
    {
      "<leader>dD",
      function()
        require("dap").disconnect()
      end,
      desc = "Dap | Disconnect",
      silent = true,
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Dap | Breakpoint Condition",
      silent = true,
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Dap | Run Last",
      silent = true,
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Dap | Evaluate",
    },
    {
      "<leader>dg",
      function()
        require("dap").goto_()
      end,
      desc = "Dap | Go to Line (No Execute)",
    },
    {
      "<leader>dj",
      function()
        require("dap").down()
      end,
      desc = "Dap | Down",
    },
    {
      "<leader>dk",
      function()
        require("dap").up()
      end,
      desc = "Dap | Up",
    },
    {
      "<leader>dp",
      function()
        require("dap").pause()
      end,
      desc = "Dap | Pause",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Dap | Toggle REPL",
    },
    {
      "<leader>ds",
      function()
        require("dap").session()
      end,
      desc = "Dap | Session",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Dap | Terminate",
    },
    {
      "<leader>dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Dap | Widgets",
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
