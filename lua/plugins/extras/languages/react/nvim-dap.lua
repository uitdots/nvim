local dap_javascriptreact = require("configs.dap.configurations.javascriptreact")
local dap_typescriptreact = require("configs.dap.configurations.typescriptreact")

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    dap_javascriptreact.setup()
    dap_typescriptreact.setup()
  end,
  optional = true,
}
