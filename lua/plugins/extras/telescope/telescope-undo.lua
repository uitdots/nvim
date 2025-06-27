-- NOTE: Remove this later if using snacks

---@type NvPluginSpec
return {
  "debugloop/telescope-undo.nvim",
  enabled = false,
  keys = {
    {
      "<leader>fu",
      function()
        require("telescope").extensions.undo.undo({ side_by_side = true })
      end,
      desc = "Find | Undo",
      silent = true,
    },
  },
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions_list = {
          "undo",
        },
      },
      opts_extend = {
        "extensions_list",
      },
      dependencies = "debugloop/telescope-undo.nvim",
    },
  },
}
