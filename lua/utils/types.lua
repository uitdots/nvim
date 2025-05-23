---Source https://luacode.wordpress.com/2011/09/23/lua-function-to-check-if-a-table-is-an-array/
local M = {}

---@param t table
---@param opts? {strict: boolean}
---@return boolean
function M.is_list(t, opts)
  if not opts or not opts.strict then
    return M.loose_is_list(t)
  else
    return M.strict_is_list(t)
  end
end

---@private
---@param t table
---@return boolean
function M.loose_is_list(t)
  for k in pairs(t) do
    return type(k) == "number"
  end
end

---@private
---@param t table
---@return boolean
function M.strict_is_list(t)
  local count = 0
  for k in pairs(t) do
    if type(k) ~= "number" then
      return false
    else
      count = count + 1
    end
  end
  for i = 1, count do
    if not t[i] and type(t[i]) ~= "nil" then
      return false
    end
  end
  return true
end

return M
