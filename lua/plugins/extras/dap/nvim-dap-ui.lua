---@type LazySpec
return {
  "rcarriga/nvim-dap-ui",
  enabled = true,
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
  },
  specs = {
    {
      "mfussenegger/nvim-dap",
      dependencies = "rcarriga/nvim-dap-ui",
    },
    {
      "folke/lazydev.nvim",
      optional = true,
      opts = {
        library = {
          "nvim-dap-ui",
        },
      },
      opts_extend = {
        "library",
      },
    },
  },
}
