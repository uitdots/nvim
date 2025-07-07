local preferences = require("preferences")
local lspconfig = require("configs.lsp.lspconfig")

table.insert(preferences.no_setup_lsps, "rust-analyzer")

---@type LazySpec
return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  event = "VeryLazy",
  init = function()
    ---@type rustaceanvim.Opts
    vim.g.rustaceanvim = {
      tools = {},

      server = {
        on_attach = lspconfig.on_attach,
        capabilities = lspconfig.capabilities,
        on_init = lspconfig.on_init,
      },

      dap = {},
    }
  end,
}
