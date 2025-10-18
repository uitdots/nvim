---@type LazySpec
return {
  "dmtrKovalenko/fff.nvim",
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
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fff").find_files()
      end,
      desc = "FFFind files",
    },
  },
  lazy = false,
}
