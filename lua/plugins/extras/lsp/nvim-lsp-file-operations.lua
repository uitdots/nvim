-- NOTE: Maybe remove this plugin because we dont need it anymore

---@type LazySpec
return {
  "antosha417/nvim-lsp-file-operations",
  enabled = false,
  config = true, -- NOTE: Does this work? It will config before lsps are setup
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
}
