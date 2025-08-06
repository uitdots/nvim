local M = {}

---@class Headers
---@field uitvim fun(): string[]
---@field uv fun(): string[]

---@type Headers
M.headers = setmetatable({}, {
  __index = function(_, key)
    return require(string.format("configs.ui.nvdash.headers.%s", key))
  end,
})

return M
