local M = {}

M.get_path_from_executable = function(executable)
  local path = vim.fn.fnamemodify(vim.fn.exepath(executable), ":h")
  return path == "." and nil or path
end

M.open_spell_sugestion = function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  if col <= #line and line:sub(col, col):match("%a") then
    vim.cmd("Telescope spell_suggest")
  end
end

--- Return the executable path if exist in $PATH, fallback to mason package
---@param path string executable file
---@param mason? { package: string, inner_path?: string } mason package
---@param opts? { full_path?: boolean }
---@return string?
M.get_executable = function(path, mason, opts)
  local full_path = vim.fn.exepath(path)
  if full_path ~= "" then
    return opts ~= nil and opts.full_path == true and full_path or path
  end
  if mason == nil then
    return nil
  end
  local mason_root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
  local ret = mason_root .. "/packages/" .. mason.package .. "/" .. mason.inner_path ~= nil and (mason.inner_path .. "/")
    or "" .. path
  if not vim.loop.fs_stat(ret) then
    vim.notify("Exetable not found: " .. mason.package, vim.log.levels.WARN)
    return
  end
  return ret
end

return M
