local dap_javascript = require("configs.dap.configurations.javascript")

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    dap_javascript.setup()
  end,
  optional = true,
}
