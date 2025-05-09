local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string
M.status = ""

---@type nil | false | any
M.lint = nil

function M.set_status()
  if M.lint == false then
    return
  end
  local lint_ok, lint
  if M.lint == nil then
    lint_ok, lint = pcall(require, "lint")
    if not lint_ok then
      M.lint = false
      return
    end
    M.lint = lint
  else
    lint = M.lint
  end

  local linters = lint._resolve_linter_by_ft(vim.bo.filetype)
  if #linters == 0 then
    M.status = ""
    return
  end

  if vim.o.columns < 100 then
    M.status = " %#St_gitIcons#  "
    return
  end

  M.status = " %#St_gitIcons# " .. table.concat(linters, ", ") .. " "
end

function M.render()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M.current_bufnr = bufnr
    M.set_status()
  end
  return M.status
end

return M.render
