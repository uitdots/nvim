local json_encode = require("utils.json").encode

local M = {}

---@private
M.json = {
  ---@private
  path = vim.fn.stdpath("config") .. "/uitvim.json",
  ---@type UitVimConfig?
  data = require("uitvim.config"),
}

function M.load_config()
  local f = io.open(M.json.path, "r")

  if not f then
    return
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
    return
  end

  M.json.data = vim.tbl_deep_extend("force", M.json.data, json or {})
end

function M.save_config()
  local f = io.open(M.json.path, "w")

  if not f then
    return
  end

  f:write(json_encode(M.json.data))
  f:close()
end

return M
