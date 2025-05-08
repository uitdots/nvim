-- NOTE: Remove this later if using snacks

---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  dependencies = {
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
  },
}
