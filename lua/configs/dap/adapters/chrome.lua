local home = require("utils.os").home
local get_executable = require("utils.executable").get_executable
local DapAdapter = require("configs.dap.dap_adapter")

local M = DapAdapter.new()

function M:get_adapter()
  -- TODO: I don't know where it out, currently I cannot download it from mason
  local adapter = get_executable("chromeDebug.js", { masons = "packages/vscode-chrome-debug/out/src" })
  ---@cast adapter string?
  return adapter
end

function M:setup(adapter)
  self.dap.adapters.chrome = {
    id = "chrome",
    type = "executable",
    command = "node",
    args = {
      string.format("%s/%s", home, adapter),
    },
  }
end

return M
