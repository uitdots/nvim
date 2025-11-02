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

---@private
---@type boolean?
M.ok = nil

---@private
---@module 'lint'
M.lint = nil

---@private
---@param bufnr number
---@return nil
function M.set_state(bufnr)
  local linters = M.lint._resolve_linter_by_ft(bo[bufnr].filetype)

  if #linters == 0 then
    M.state = nil
    return
  end

  if o.columns < 100 then
    M.state = "%#St_gitIcons#  "
    return
  end

  M.state = string.format("%%#St_gitIcons# %s ", table.concat(linters, ", "))
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

---@return string?
return function()
  if M.ok then
    return M.state
  end

  if M.ok == nil then
    if package.loaded["lint"] == nil then
      return
    else
      M.ok, M.lint = pcall(require, "lint")
    end
  end

  if M.ok == false then
    return
  end

  M.setup()
  return M.state
end
