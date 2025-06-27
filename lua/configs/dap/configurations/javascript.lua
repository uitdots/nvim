local dap = require("dap")
local dap_utils = require("dap.utils")
local pwa_node = require("configs.dap.adapters.pwa-node")

local M = {}

M.configurations = {
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
    name = "Attach",
    processId = dap_utils.pick_process,
    cwd = "${workspaceFolder}",
  },
}

function M.setup()
  local status = pwa_node.setup()
  if status then
    dap.configurations.javascript = M.configurations
  end
end

return M
