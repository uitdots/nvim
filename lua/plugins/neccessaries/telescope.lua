---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    { "<C-Space>", require("core.utils").open_spell_sugestion, desc = "Find | Spell Suggest", silent = true },
    { "<M-;>", require("core.utils").open_spell_sugestion, desc = "Find | Spell Suggest", silent = true },
  },
  opts = {
    extensions_list = {
      "fzf",
    },
    defaults = {
      path_display = { "smart" },
      file_ignore_patterns = { "node_modules", "\\.git/", "\\.git\\" },
    },
  },
}
