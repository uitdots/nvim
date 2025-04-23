local function debounce(fn, ms)
  local timer = vim.uv.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

local M = {}

---@private
---@type integer?
M.current_bufnr = nil

---@private
---@type string
M.status = ""

---@param bufnr number?
function M._set_status(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local lsps = vim.lsp.get_clients({ bufnr = bufnr })

  if #lsps == 0 then
    M.status = ""
    return
  end

  if vim.o.columns < 100 then
    M.status = " %#St_gitIcons# "
    return
  end

  local clients = vim.tbl_map(function(client)
    return client.name
  end, lsps)

  M.status = "%#St_gitIcons# " .. table.concat(clients, ", ") .. " "
end

function M._setup_autocmds()
  vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
    pattern = "*",
    callback = function()
      M._set_status()
    end,
    group = vim.api.nvim_create_augroup("LspStatusLineAttachDetach", {}),
  })

  vim.api.nvim_create_autocmd({ "VimResized" }, {
    pattern = "*",
    callback = debounce(M._set_status, 500),
    500,
    group = vim.api.nvim_create_augroup("LspStatusLineVimResize", {}),
  })
end

function M.render()
  local bufnr = vim.api.nvim_get_current_buf()

  if bufnr ~= M.current_bufnr then
    M._set_status(bufnr)
  end

  return M.status
end

return M.render
