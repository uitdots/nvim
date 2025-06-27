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

  -- TODO: I don't know where it out, currently I cannot download it from mason
  local adapter = get_executable("chromeDebug.js", "packages/vscode-chrome-debug/out/src")

  if adapter == nil then
    M.status = false
    return M.status
  end

  dap.adapters.chrome = {
    id = "chrome",
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
