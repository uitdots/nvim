-- NOTE: Remove this later if using snacks

---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  dependencies = {
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
  },
}
