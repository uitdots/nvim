-- NOTE: Maybe remove this plugin because we dont need it anymore
local ide_mode = require("utils.os").ide_mode

---@type LazySpec
return {
  "antosha417/nvim-lsp-file-operations",
  enabled = false,
  cond = ide_mode,
  config = true, -- NOTE: Does this work? It will config before lsps are setup
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
}
