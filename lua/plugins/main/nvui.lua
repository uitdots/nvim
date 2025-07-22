---@type LazySpec
return {
  {
    "NvChad/ui",
    lazy = false,
    config = function()
      require("nvchad")
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "nvchad/base46",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
    keys = {
      {
        "<leader>ur",
        function()
          require("base46").load_all_highlights()
        end,
        desc = "Utils | Refresh UI (NvChad)",
        silent = true,
      },
      {
        "<leader>ot",
        function()
          require("base46").toggle_theme()
          vim.notify(vim.g.icon_toggled and "Light" or "Dark", vim.log.levels.INFO, { title = "Theme", id = "base46_theme" })
        end,
        desc = "Options | Toggle Theme",
        silent = true,
      },
      {
        "<leader>oT",
        function()
          require("base46").toggle_transparency()
          vim.notify(require("nvconfig").base46.transparency and "Enabled" or "Disabled", vim.log.levels.INFO, { title = "Transparency", id = "base46_transparency" })
        end,
        desc = "Options | Toggle Theme",
        silent = true,
      },
    },
    init = function()
      vim.g.base46_cache = string.format("%s/base46/", vim.fn.stdpath("data"))
    end,
    config = function()
      local base46_cache = vim.g.base46_cache
      for _, v in ipairs(vim.fn.readdir(base46_cache)) do
        dofile(string.format("%s/%s", base46_cache, v))
      end
    end,
  },
}
