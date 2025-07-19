local get_executable = require("utils.executable").get_executable
local DapAdapter = require("configs.dap.dap_adapter")

local M = DapAdapter.new()

function M:get_adapter()
  local adapter = get_executable("dapDebugServer.js", { masons = "packages/js-debug-adapter/js-debug/src" })
  ---@cast adapter string?
  return adapter
end

function M:setup(adapter)
  self.dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = {
        adapter,
        "${port}",
      },
    },
  }
end

return M
