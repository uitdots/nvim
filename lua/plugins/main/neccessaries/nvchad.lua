---@type NvPluginSpec
return {
  {
    "NvChad/NvChad",
    branch = "v2.5",
    init = function()
      vim.api.nvim_create_user_command("NvChadMasonInstallAll", function()
        require("nvchad.mason").install_all()
      end, { desc = "NvChad Mason Install All" })
    end,
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
          require("telescope").extensions.themes.themes()
          -- require("nvchad.themes").open()
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
}
