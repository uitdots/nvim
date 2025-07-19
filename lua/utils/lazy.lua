-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua
local autocmd = vim.api.nvim_create_autocmd

local M = {}

---@param name string
function M.get_plugin(name)
  return require("lazy.core.config").spec.plugins[name]
end

---@param plugin string
function M.has_plugin(plugin)
  return M.get_plugin(plugin) ~= nil
end

---@param name string
---@param path string?
function M.get_plugin_path(name, path)
  local plugin = M.get_plugin(name)
  path = path and "/" .. path or ""
  return plugin and (plugin.dir .. path)
end

---For those plugins you need to use it's vim stuff like ftdetect, syntax...
---But you still want to lazy load it on filetypes
---@param main string The plugin name (not the repo name bruh)
---@param fts string | string[]
---@param opts table?
function M.lazy_load_on_fts(main, fts, opts)
  if type(fts) == "string" then
    fts = { fts }
  end
  autocmd("FileType", {
    once = true,
    pattern = fts,
    callback = function()
      require(main).setup(opts)
    end,
  })
end

return M
