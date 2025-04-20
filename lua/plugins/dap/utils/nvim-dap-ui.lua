---@type NvPluginSpec
return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dd",
        function()
          require("dapui").toggle()
        end,
        desc = "Debug | Dap UI",
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
      "mfussenegger/nvim-dap",
    },
  },
  {
    "folke/lazydev.nvim",
    optional = true,
    opts = function(_, opts)
      opts.library = vim.list_extend(opts.library or {}, { "nvim-dap-ui" })
    end,
  },
}
