local home = require("utils.os").home
local get_executable = require("utils.executable").get_executable
local DapAdapter = require("configs.dap.dap_adapter")

local M = DapAdapter.new()

function M:get_adapter()
  -- TODO: Check later
  local adapter = get_executable("adapter.bundle.js", { masons = "vscode-firefox-debug/dist" })
  ---@cast adapter string?
  return adapter
end

function M:setup(adapter)
  self.dap.adapters.firefox = {
    id = "firefox",
    type = "executable",
    command = "node",
    args = {
      string.format("%s/%s", home, adapter),
    },
  }
end

return M
