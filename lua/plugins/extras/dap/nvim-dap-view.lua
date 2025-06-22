---@type NvPluginSpec
return {
  "igorlfs/nvim-dap-view",
  enabled = true,
  cmd = {
    "DapViewOpen",
    "DapViewClose",
    "DapViewToggle",
    "DapViewWatch",
    "DapViewJump",
    "DapViewShow",
  },
  keys = {
    {
      "<leader>dd",
      "<cmd>DapViewToggle<CR>",
      desc = "Debug | Toggle View",
      silent = true,
    },
    {
      "<leader>dw",
      "<cmd>DapViewWatch<CR>",
      desc = "Debug | Watch",
      silent = true,
    },
  },
  ---@module 'dap-view'
  ---@type dapview.Config
  opts = nil,
  config = function(_, opts)
    local dap = require("dap")
    local dv = require("dap-view")

    dv.setup(opts)

    dap.listeners.before.attach["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.launch["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.event_terminated["dap-view-config"] = function()
      dv.close()
    end
    dap.listeners.before.event_exited["dap-view-config"] = function()
      dv.close()
    end
  end,
  dependencies = {
    "mfussenegger/nvim-dap",
  },
}
