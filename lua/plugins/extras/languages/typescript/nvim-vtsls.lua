local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "yioneko/nvim-vtsls",
  enabled = is_executable("vtsls"),
  -- TODO: check, does it need nvim-lspconfig
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      optional = true,
    },
  },
}
