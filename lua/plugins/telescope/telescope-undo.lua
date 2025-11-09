-- NOTE: Remove this later if using snacks

---@type LazySpec
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
  config = function()
    require("telescope").load_extension("undo")
  end,
  dependencies = "nvim-telescope/telescope.nvim",
}
