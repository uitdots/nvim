---@type NvPluginSpec
return {
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
  cond = vim.g.use_lsp_file_operation,
  config = true, -- NOTE: Does this work? It will config before lsps are setup
}
