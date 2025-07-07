---@meta _

---@class PluginsOpts

---@class PluginsOpts.NvimJdtlsOpts
---@field lspconfig? vim.lsp.Config
---@field bundles? any[] For lazyloading, use the function here

---@module 'neotest'
---@class PluginsOpts.NeotestOpts : neotest.Config
---The key is for requiring the adapter to setup (setup is passing directly, or setup method, or adapter method, or the instance get from requiring the adapter)
---If the value type is false, will call require it only (faster)
---If the value is true, will call setup. Be careful with this
---If the value is a table, will pass the table into setup
---If the value is a function, will call it and pass its return into setup. Use this for lazy loading!
---@field adapters? table<string, boolean | table | fun():table>
