---@type LazySpec
return {
  "yorickpeterse/nvim-window",
  keys = {
    {
      "<C-w><C-j>",
      function()
        require("nvim-window").pick()
      end,
      desc = "Pick a window",
    },
  },
  opts = {
    chars = {
      "a",
      "s",
      "d",
      "f",
      "g",

      "q",
      "w",
      "e",
      "r",
      "t",

      "c",
      "v",

      "h",
      "j",
      "k",
      "l",

      "y",
      "u",
      "i",
      "o",
      "p",

      "z",
      "x",

      "b",
      "n",
      "m",
    },
  },
}
