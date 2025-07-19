---@class DapAdapter
---@field is_setup DapAdapter.SetupStatus
---@field adapter string?
---@field get_adapter fun(self: DapAdapter):string?
---@field setup fun(self: DapAdapter, adapter: string)
local M = {}
M.__index = M

---@module 'dap'
M.dap = require("dap")

---@protected
---@enum DapAdapter.SetupStatus
M.setup_status = {
  NOT_YET = nil,
  FAILED = false,
  SUCCESSFUL = true,
}

---@return boolean
function M:__call()
  if self.is_setup ~= M.setup_status.NOT_YET then
    self.adapter = self:get_adapter()
    if self.adapter == nil then
      self.is_setup = self.setup_status.FAILED
      return self.setup_status.FAILED
    end
    self:setup(self.adapter)
  end
  self.is_setup = self.setup_status.SUCCESSFUL
  return self.setup_status.SUCCESSFUL
end

---@return DapAdapter
function M.new()
  local self = setmetatable({}, M)
  return self
end

return M
