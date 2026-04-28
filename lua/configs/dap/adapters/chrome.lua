---@class ChromeDapAdapter
local M = {}
M.__index = M

M.dap = require("dap")

---@param self ChromeDapAdapter
---@return boolean
function M:setup()
  if self._status ~= nil then
    return self._status
  end

  local finder = require("utils.executable").get_executable
  local path = finder("chromeDebug.js", { masons = "packages/vscode-chrome-debug/out/src" })
  if type(path) ~= "string" or path == "" then
    self._status = false
    return false
  end

  self.dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { require("utils.os").home .. "/" .. path },
  }

  self._status = true
  return true
end

return setmetatable(M, {
  __call = function(self)
    return self:setup()
  end,
})
