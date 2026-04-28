local dap = require("dap")
local dap_utils = require("dap.utils")
local pwa_node = require("configs.dap.adapters.pwa-node")

local configurations = {
  javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = function()
        return dap_utils.pick_process()
      end,
      cwd = "${workspaceFolder}",
    },
  },
}

return function()
  if pwa_node() then
    dap.configurations = vim.tbl_deep_extend("force", dap.configurations or {}, configurations)
  end
end