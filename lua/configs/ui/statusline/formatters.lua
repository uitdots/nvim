local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string
M.status = ""

---@type nil | false | any
M.conform = nil

function M.set_status()
  if M.conform == false then
    return
  end
  local conform_ok, conform
  if M.conform == nil then
     conform_ok, conform = pcall(function ()
      return require("conform")
    end)
    if not conform_ok then
      M.conform = false
      return
    end
    M.conform = conform
    else
    conform = M.conform
  end

  local formatters = conform.list_formatters(0)
  if #formatters == 0 then
    M.status = ""
    return
  end

  if vim.o.columns < 100 then
    M.status = " %#St_gitIcons#  "
    return
  end

  local formatters_names = vim.tbl_map(function(formatter)
    return formatter.name
  end, formatters)

  M.status = " %#St_gitIcons# " .. table.concat(formatters_names, ", ") .. " "
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
