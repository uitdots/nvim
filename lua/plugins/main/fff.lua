---@type LazySpec
return {
  "dmtrKovalenko/fff.nvim",
  lazy = false,
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    title = "Find Files",
    prompt = "",
    layout = {
      prompt_position = "top",
    },
    keymaps = {
      close = "<C-c>",
      move_up = {
        "<Up>",
        "<C-p>",
        "<S-Tab>",
      },
      move_down = {
        "<Down>",
        "<C-n>",
        "<Tab>",
      },
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fff").find_files()
      end,
      desc = "General | FFFind files",
    },
  },
}
