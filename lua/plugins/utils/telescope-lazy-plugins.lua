---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  optional = true,
  dependencies = {
    "polirritmico/telescope-lazy-plugins.nvim",
  },
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
}
