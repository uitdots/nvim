---@type NvPluginSpec
return {
  {
    "NvChad/ui",
    lazy = false,
    branch = "v3.0",
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
    init = function()
      vim.api.nvim_create_user_command("NvChadLoadAllHighlights", function()
        require("base46").load_all_highlights()
      end, { desc = "NvChad | NvChad Load All Highlights" })
    end,
    config = function()
      local base46_cache = vim.g.base46_cache
      for _, v in ipairs(vim.fn.readdir(base46_cache)) do
        dofile(string.format("%s/%s", base46_cache, v))
      end
    end,
  },
}
