local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  "yioneko/nvim-vtsls",
  enabled = is_executable("vtsls"),
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      optional = true,
      opts = function(_, opts)
        require("lspconfig.configs").vtsls = require("vtsls").lspconfig
        return opts
      end,
    },
  },
}
