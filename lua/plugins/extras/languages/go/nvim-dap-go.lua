---@type NvPluginSpec
return {
  {
    ---This plugin is started with nvim-dap
    "leoluz/nvim-dap-go",
    config = function() end, -- Let nvim-dap call it to setup
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap_go_spec = require("lazy.core.config").spec.plugins["nvim-dap-go"]
      if not dap_go_spec then
        return
      end
      local plugin = require("lazy.core.plugin")
      local dap_go_opts = plugin.values(dap_go_spec, "opts", false)
      require("dap-go").setup(dap_go_opts)
    end,
    dependencies = "leoluz/nvim-dap-go",
  },
}
