local api = vim.api
local lsp = vim.lsp
local o = vim.o

local M = {}

---@private
---@type string?
M.state = nil

---@private
---@type true?
M.have_setup_autocmd = nil

---@private
---@param bufnr number
---@return nil
function M.set_state(bufnr)
  local lsps = lsp.get_clients({ bufnr = bufnr })

  if #lsps == 0 then
    M.state = nil
    return
  end

  if o.columns < 100 then
    M.state = "%#St_gitIcons#  "
    return
  end

  ---@param client vim.lsp.Client
  local clients = vim.tbl_map(function(client)
    return client.name
  end, lsps)

  M.state = string.format("%%#St_gitIcons# %s ", table.concat(clients, ", "))
end

---@private
function M.setup_autocmd()
  if M.have_setup_autocmd then
    return
  end
  M.have_setup_autocmd = true
  api.nvim_create_autocmd({
    "LspAttach",
    "LspDetach",
    "BufEnter",
  }, {
    callback = function(args)
      M.set_state(args.buf)
    end,
  })
end

---@return string?
return function()
  M.setup_autocmd()
  return M.state
end
