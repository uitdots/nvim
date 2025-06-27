-- NOTE: Remove this later if using snacks

---@type NvPluginSpec
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
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions_list = {
          "lazy_plugins",
        },
      },
      opts_extend = {
        "extensions_list",
      },
      dependencies = "polirritmico/telescope-lazy-plugins.nvim",
    },
  },
}
