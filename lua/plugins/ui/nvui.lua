---@type NvPluginSpec
return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "NvChad/ui",
    event = "VeryLazy",
    branch = "v3.0",
    config = function()
      require("nvchad")
    end,
  },
  {
    "nvchad/base46",
    event = "VeryLazy",
    build = function()
      require("base46").load_all_highlights()
    end,
    init = function()
      vim.api.nvim_create_user_command("NvChadBase46LoadAllHighLights", function()
        require("base46").load_all_highlights()
      end, { desc = "NvChad | Base46 Load All Highlights" })
    end,
  },
}
