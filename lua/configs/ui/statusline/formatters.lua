local api = vim.api
local o = vim.o
local bo = vim.bo

local M = {}

---@private
---@type string?
M.state = nil

---@private
---@type true?
M.have_setup_autocmd = nil

---@type boolean?
M.ok = nil

---@module 'conform'
M.conform = nil

---@private
---@param bufnr number
---@return nil
function M.set_state(bufnr)
  local formatters = M.conform.list_formatters(bufnr)

  if #formatters == 0 then
    M.state = nil
    return
  end

  if o.columns < 100 then
    M.state = "%#St_gitIcons#  "
    return
  end

  ---@param formatter conform.FormatterInfo
  local formatters_names = vim.tbl_map(function(formatter)
    return formatter.name
  end, formatters)
  M.state = string.format("%%#St_gitIcons# %s ", table.concat(formatters_names, ", "))
end

---@private
function M.setup()
  if M.have_setup_autocmd then
    return
  end
  M.have_setup_autocmd = true
  M.set_state(api.nvim_get_current_buf())
  api.nvim_create_autocmd({
    "BufEnter",
  }, {
    callback = function(args)
      M.set_state(args.buf)
    end,
  })
end

---@return string|nil
return function()
  if M.ok then
    return M.state
  end

  if M.ok == nil then
    if package.loaded["conform"] == nil then
      return
    else
      M.ok, M.conform = pcall(require, "conform")
    end
  end

  if M.ok == false then
    return
  end

  M.setup()
  return M.state
end
