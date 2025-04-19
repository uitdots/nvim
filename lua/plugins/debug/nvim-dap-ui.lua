---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
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
        "<leader>dd",
        function()
          require("dapui").toggle()
        end,
        desc = "Debug | Dap UI",
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
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup(opts)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      {
        "folke/lazydev.nvim",
        opts = function(_, opts)
          opts.library = vim.list_extend(opts.library or {}, { "nvim-dap-ui" })
        end,
      },
    },
  },
}
