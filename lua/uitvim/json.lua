local json_encode = require("utils.json").encode
local default_config = require("uitvim.config")

local M = {}

---@private
M.path = vim.fn.stdpath("config") .. "/uitvim.json"

---@type UitVimConfig?
M.data = nil

---@private
---@return UitVimConfig | {}
function M.load_user_config()
  local f = io.open(M.path, "r")

  if not f then
    return {}
  end

  local data = f:read("*a")
  f:close()

  local ok, json = pcall(vim.json.decode, data, {
    luanil = {
      object = true,
      array = true,
    },
  })
  if not ok then
    return {}
  end
  return json
end

---@private
function M.save_user_config()
  local f = io.open(M.path, "w")

  if not f then
    return
  end

  f:write(json_encode(M.data))
  f:close()
end

function M.setup()
  local user_config = M.load_user_config()
  M.data = vim.tbl_deep_extend("force", default_config, user_config)
  vim.schedule(M.save_user_config)
end

---@return UitVimConfig
function M.get_merged_config()
  return M.data
end

return M
