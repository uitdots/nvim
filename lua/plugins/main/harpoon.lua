---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
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
      "<M-1>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon | 1",
    },
    {
      "<M-2>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon | 2",
    },
    {
      "<M-3>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon | 3",
    },
    {
      "<M-4>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon | 4",
    },
    {
      "<M-5>",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon | 5",
    },
    {
      "<M-6>",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "Harpoon | 6",
    },
    {
      "<M-7>",
      function()
        require("harpoon"):list():select(7)
      end,
      desc = "Harpoon | 7",
    },
    {
      "<M-8>",
      function()
        require("harpoon"):list():select(8)
      end,
      desc = "Harpoon | 8",
    },
    {
      "<M-9>",
      function()
        require("harpoon"):list():select(9)
      end,
      desc = "Harpoon | 9",
    },
  },
  ---@module 'harpoon'
  ---@type HarpoonPartialConfigItem
  opts = nil,
  config = function(_, opts)
    require("harpoon"):setup(opts)
  end,
  dependencies = "nvim-lua/plenary.nvim",
}
