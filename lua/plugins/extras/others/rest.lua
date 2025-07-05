local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "rest-nvim/rest.nvim",
  name = "rest-nvim",
  enabled = not is_windows,
  keys = {
    {
      "<leader>qL",
      "<cmd>Rest log<cr>",
      desc = "Query API | Rest Log",
      ft = "http",
      silent = true,
    },
    {
      "<leader>ql",
      "<cmd>Rest last<cr>",
      desc = "Query API | Rest Last",
      ft = "http",
      silent = true,
    },
    {
      "<leader>qE",
      "<cmd>Rest env<cr>",
      desc = "Query API | Rest Env",
      ft = "http",
      silent = true,
    },
    {
      "<leader>qe",
      "<cmd>Telescope rest select_env<cr>",
      desc = "Query API | Rest Telescope Env",
      ft = "http",
      silent = true,
    },
    {
      "<leader>qr",
      "<cmd>Rest run<cr>",
      desc = "Query API | Rest Run",
      ft = "http",
      silent = true,
    },
    {
      "<leader>qR",
      "<cmd>Rest result<cr>",
      desc = "Query API | Rest Result",
      ft = "http",
      silent = true,
    },
  },
  config = function()
    require("telescope").load_extension("rest")
    ---@module 'rest-nvim'
    ---@type rest.Opts
    vim.g.rest_nvim = {}
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "luarocks/hererocks",
  },
}
