---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false, -- it is loaded by statusline though
  keys = {
    {
      "<M-a>",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("harpoon"):list():add()
      end,
      desc = "Harpoon | Add",
    },
    {
      "<M-r>",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("harpoon"):list():remove()
      end,
      desc = "Harpoon | Remove",
    },
    {
      "<M-`>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon | Toggle Menu",
    },
    {
      "<M-n>",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon | Next",
    },
    {
      "<M-p>",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon | Previous",
    },
    {
      "<M-q>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon | 1",
    },
    {
      "<M-w>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon | 2",
    },
    {
      "<M-e>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon | 3",
    },
    {
      "<M-r>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon | 4",
    },
    {
      "<M-t>",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon | 5",
    },
    {
      "<M-y>",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "Harpoon | 6",
    },
    {
      "<M-u>",
      function()
        require("harpoon"):list():select(7)
      end,
      desc = "Harpoon | 7",
    },
    {
      "<M-i>",
      function()
        require("harpoon"):list():select(8)
      end,
      desc = "Harpoon | 8",
    },
    {
      "<M-o>",
      function()
        require("harpoon"):list():select(9)
      end,
      desc = "Harpoon | 9",
    },
    {
      "<M-p>",
      function()
        require("harpoon"):list():select(10)
      end,
      desc = "Harpoon | 10",
    },
  },
  ---@module 'harpoon'
  ---@type HarpoonPartialConfigItem
  opts = nil,
  config = function(_, opts)
    require("harpoon"):setup(opts)
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  specs = {
    {
      "rmagatti/auto-session",
      optional = true,
      dependencies = "ThePrimeagen/harpoon", -- Has to load before session plugin
    },
  },
}
