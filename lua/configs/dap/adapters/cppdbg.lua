---@class CPPDBGAdapter
---@field _status boolean|nil
local M = {}
M.__index = M

---@module "dap"
M.dap = require("dap")

---@param self CPPDBGAdapter
---@return boolean
function M:setup()
  if self._status ~= nil then
    return self._status
  end

  local finder = require("utils.executable").get_executable
  local path = finder("OpenDebugAD7", { masons = "packages/cpptools/extension/debugAdapters/bin" })
  if type(path) ~= "string" or path == "" then
    self._status = false
    return false
  end

  self.dap.adapters.cppdbg = {
    type = "executable",
    command = path,
    options = {
      detached = require("utils.os").is_windows and false or nil,
    },
  }

  self._status = true
  return true
end

return setmetatable(M, {
  __call = function(self)
    return self:setup()
  end,
})
