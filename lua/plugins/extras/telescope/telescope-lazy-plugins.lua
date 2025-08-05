-- NOTE: Remove this later if using snacks

---@type LazySpec
return {
  "polirritmico/telescope-lazy-plugins.nvim",
  enabled = false,
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope").extensions.lazy_plugins.lazy_plugins()
      end,
      desc = "Find | Plugins",
      silent = true,
    },
  },
  config = function()
    require("telescope").load_extension("lazy_plugins")
  end,
  dependencies = "nvim-telescope/telescope.nvim",
}
