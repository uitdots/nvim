local lsp = require("configs.lsp")

---@type LazySpec
return {
  "sigmaSd/deno-nvim",
  enabled = false, -- TODO: Check this when it support neovim 0.11 API
  opts = {
    ---@type vim.lsp.Config
    ---@diagnostic disable-next-line: missing-fields
    server = {
      capabilites = lsp.capabilities,
      on_init = lsp.on_init,
    },
  },
}
