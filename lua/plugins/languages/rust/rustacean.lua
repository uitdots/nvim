local lsp = require("configs.lsp")

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
        capabilities = lsp.capabilities,
        on_init = lsp.on_init,
      },

      dap = {},
    }
  end,
}
