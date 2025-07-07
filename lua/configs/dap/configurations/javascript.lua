local dap = require("dap")
local dap_utils = require("dap.utils")
local pwa_node = require("configs.dap.adapters.pwa-node")

---@type dap.Configuration[]
local configurations = {
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

return function()
  local status = pwa_node()
  if status then
    dap.configurations.javascript = configurations
  end
end
