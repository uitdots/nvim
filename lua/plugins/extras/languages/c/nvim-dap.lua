---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    require("configs.dap.configurations.c").setup()
  end,
  optional = true,
}
