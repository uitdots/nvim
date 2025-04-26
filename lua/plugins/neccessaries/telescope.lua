---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  optional = true,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    extensions_list = {
      "fzf",
      "notify",
    },
    defaults = {
      path_display = { "smart" },
      file_ignore_patterns = {
        "node_modules",
        ".git",
        ".egg-info",
        "*bin*",
        "*cache*",
        "*debug*",
        "*obj*",
        ".dart_tool",
        ".git",
        ".husky/_",
        ".idea",
        ".next",
        ".venv*",
        ".vs",
        "__pycache__",
        "build",
        "dist",
        "node_modules",
      },
    },
  },
  keys = {
    -- General
    {
      "<C-Space>",
      function()
        require("telescope.builtin").spell_suggest()
      end,
      desc = "General | Spell Suggest",
      silent = true,
      mode = {
        "n",
        "v",
      },
    },
    {
      "<M-;>",
      function()
        require("telescope.builtin").spell_suggest()
      end,
      desc = "General | Spell Suggest",
      silent = true,
      mode = {
        "n",
        "v",
      },
    },

    -- Find
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find | Files",
      silent = true,
    },
    {
      "<leader>fa",
      function()
        require("telescope.builtin").autocommands()
      end,
      desc = "Find | Autocommands",
      silent = true,
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").marks()
      end,
      desc = "Find | Marks",
      silent = true,
    },
    {
      "<leader>fM",
      function()
        require("telescope.builtin").man_pages()
      end,
      desc = "Find | Man Pages",
      silent = true,
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Find | Word",
      silent = true,
    },
    {
      "<leader>ft",
      "<cmd>Find themes<cr>", -- what is this?
      desc = "Find | Themes",
      silent = true,
    },
    {
      "<leader>fB",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find | Buffers",
      silent = true,
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Find | Buffer Lines",
      silent = true,
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "Find | Notify History",
      silent = true,
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Find | Help",
      silent = true,
    },
    {
      "<leader>fH",
      function()
        require("telescope.builtin").highlights()
      end,
      desc = "Find | Highlights",
      silent = true,
    },
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      "<cmd>Find keymaps<cr>",
      desc = "Find | Keymaps",
      silent = true,
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").commands()
      end,
      desc = "Find | Commands",
      silent = true,
    },
    {
      "<leader>fC",
      function()
        require("telescope.builtin").command_history()
      end,
      desc = "Find | Commands History",
      silent = true,
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Find | Recent Files",
      silent = true,
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").registers()
      end,
      desc = "Find | Registers",
      silent = true,
    },
    {
      "<leader>f/",
      function()
        require("telescope.builtin").search_history()
      end,
      desc = "Find | Search History",
      silent = true,
    },
    {
      "<leader>fl",
      function()
        require("telescope.builtin").loclist()
      end,
      desc = "Find | Loclist",
      silent = true,
    },
    {
      "<leader>fq",
      function()
        require("telescope.builtin").quickfix()
      end,
      desc = "Find | Quickfix",
      silent = true,
    },
    {
      "<leader>fQ",
      function()
        require("telescope.builtin").quickfixhistory()
      end,
      desc = "Find | Quickfix History",
      silent = true,
    },

    -- Git
    {
      "<leader>fc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Git | Commits",
      silent = true,
    },
    {
      "<leader>gB",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Git | Branches",
      silent = true,
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Git | Status",
      silent = true,
    },
  },
}
