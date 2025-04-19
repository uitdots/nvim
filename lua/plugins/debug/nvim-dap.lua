-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  enabled = true,
  config = function()
    require("plugins.debug.configurations.javascripts-node")
  end,
}
