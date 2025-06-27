local home = require("utils.os").home
local get_executable = require("utils.executable").get_executable
local dap = require("dap")

local M = {}

---@type boolean?
M.status = nil

---@return boolean
function M.setup()
  if M.status ~= nil then
    return M.status
  end

  -- TODO: Check later
  local adapter = get_executable("adapter.bundle.js", "vscode-firefox-debug/dist")

  if adapter == nil then
    M.status = false
    return M.status
  end

  dap.adapters.firefox = {
    id = "firefox",
    type = "executable",
    command = "node",
    args = {
      string.format("%s/%s", home, adapter),
    },
  }

  M.status = true
  return M.status
end

return M
