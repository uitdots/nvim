local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "rest-nvim/rest.nvim",
  name = "rest-nvim",
  enabled = not is_windows,
  keys = {
    {
      "<localleader>rL",
      "<cmd>Rest log<cr>",
      desc = "Rest API | Log",
      ft = "http",
      silent = true,
    },
    {
      "<localleader>rl",
      "<cmd>Rest last<cr>",
      desc = "Rest API | Last",
      ft = "http",
      silent = true,
    },
    {
      "<localleader>rE",
      "<cmd>Rest env<cr>",
      desc = "Rest API | Env",
      ft = "http",
      silent = true,
    },
    {
      "<localleader>re",
      "<cmd>Telescope rest select_env<cr>",
      desc = "Rest API | Telescope Env",
      ft = "http",
      silent = true,
    },
    {
      "<localleader>rr",
      "<cmd>Rest run<cr>",
      desc = "Rest API | Run",
      ft = "http",
      silent = true,
    },
    {
      "<localleader>rR",
      "<cmd>Rest result<cr>",
      desc = "Rest API | Result",
      ft = "http",
      silent = true,
    },
  },
  -- init = function()
  --   require("telescope").load_extension "rest"
  -- end,
  config = true,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "luarocks/hererocks",
    {
      import = "plugins.extras.languages.http",
      enabled = true,
    },
  },
}
