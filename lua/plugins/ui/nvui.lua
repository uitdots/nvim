---@type NvPluginSpec
return {
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    keys = {
      {
        "H",
        function()
          require("nvchad.tabufline").prev()
        end,
        desc = "General | Previous Buffer",
        silent = true,
      },
      {
        "L",
        function()
          require("nvchad.tabufline").next()
        end,
        desc = "General | Next Buffer",
        silent = true,
      },
      {
        "<leader>c",
        function()
          require("nvchad.tabufline").close_buffer()
        end,
        desc = "General | Close Buffer",
        silent = true,
      },
      {
        "<leader>C",
        function()
          require("nvchad.tabufline").closeAllBufs(false)
        end,
        desc = "General | Close Other Buffers",
        silent = true,
      },
      {
        "<leader>nh",
        function()
          require("nvchad.tabufline").closeBufs_at_direction("left")
        end,
        desc = "General | Close Buffers from Left",
        silent = true,
      },
      {
        "<leader>nl",
        function()
          require("nvchad.tabufline").closeBufs_at_direction("right")
        end,
        desc = "Neovim | Close Buffers from Right",
        silent = true,
      },
      {
        "<leader>ft",
        function()
          require("nvchad.themes").open()
        end,
        desc = "Find | Themes",
      },
      {
        "<leader>nc",
        "<cmd>NvCheatsheet<cr>",
        desc = "Neovim | Cheatsheet",
        silent = true,
      },
    },
  },
  {
    "NvChad/ui",
    event = "VeryLazy",
    branch = "v3.0",
    config = function()
      require("nvchad")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
