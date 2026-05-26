---@type LazySpec
return {
  "antosha417/nvim-lsp-file-operations",
  opts = function(opts)
    vim.lsp.config("*", {
      capabilities = require("lsp-file-operations").default_capabilities(),
    } --[[@as vim.lsp.Config]])
    return opts
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
}
