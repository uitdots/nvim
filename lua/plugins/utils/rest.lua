---@type NvPluginSpec
return {
  "rest-nvim/rest.nvim",
  name = "rest-nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "luarocks/hererocks",
  },
  keys = {
    {
      "<leader<C-a>L",
      "<cmd>Rest log<cr>",
      desc = "Rest | Log",
      ft = "http",
      silent = true,
    },
    {
      "<leader<C-a>l",
      "<cmd>Rest last<cr>",
      desc = "Rest | Last",
      ft = "http",
      silent = true,
    },
    {
      "<leader<C-a>E",
      "<cmd>Rest env<cr>",
      desc = "Rest | Env",
      ft = "http",
      silent = true,
    },
    {
      "<leader<C-a>e",
      "<cmd>Telescope rest select_env<cr>",
      desc = "Rest | Telescope Env",
      ft = "http",
      silent = true,
    },
    {
      "<leader<C-a>r",
      "<cmd>Rest run<cr>",
      desc = "Rest | Run",
      ft = "http",
      silent = true,
    },
    {
      "<leader<C-a>R",
      "<cmd>Rest result<cr>",
      desc = "Rest | Result",
      ft = "http",
      silent = true,
    },
  },
  -- init = function()
  --   require("telescope").load_extension "rest"
  -- end,
  config = true,
}
