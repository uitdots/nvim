local dap_c = require("configs.dap.configurations.c")

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    dap_c.setup()
  end,
  optional = true,
}
