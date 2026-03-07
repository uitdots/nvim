local api = vim.api

local M = {}

---@private
---@type string?
M.state = nil

---@private
---@type true?
M.have_setup_autocmd = nil

---@private
---@module 'harpoon'
M.harpoon = nil

M.fmtstr = "%%#St_Harpoon# 󰛢 %d/%d"

---@private
---@param bufnr number
---@return nil
function M.set_state(bufnr)
  local full_path = vim.api.nvim_buf_get_name(bufnr)
  if full_path == "" then
    M.state = nil
    return
  end

  local relative_path = vim.fn.fnamemodify(full_path, ":.")

  local _, index = M.harpoon:list():get_by_value(relative_path)
  if index then
    M.state = string.format(M.fmtstr, index, M.harpoon:list():length())
  else
    M.state = nil
  end
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
    "VimResized",
  }, {
    callback = function(args)
      M.set_state(args.buf)
    end,
  })
end

---@return string?
return function()
  if M.state then
    return M.state
  end
  M.harpoon = require("harpoon")
  M.setup()
  return M.state
end
