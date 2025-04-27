local is_executable = require("core.utils").is_executable

---@type NvPluginSpec
return {
  "yioneko/nvim-vtsls",
  enabled = is_executable("vtsls"),
  init = function()
    require("lspconfig.configs").vtsls = require("vtsls").lspconfig
  end,
}
