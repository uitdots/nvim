---@type LazySpec
return {
  "lewis6991/hover.nvim",
  enabled = false,
  event = "VeryLazy",
  init = function()
    vim.o.mousemoveevent = true
  end,
  keys = {
    {
      "K",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("hover").hover()
      end,
      desc = "General | Hover",
      silent = true,
    },
    {
      "gK",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("hover").hover_select()
      end,
      desc = "General | Select Hover",
      silent = true,
    },
    {
      "<M-p>",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("hover").hover_switch("previous")
      end,
      desc = "General | Previous Hover Source",
      silent = true,
    },
    {
      "<M-n>",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("hover").hover_switch("next")
      end,
      desc = "General | Next Hover Source",
      silent = true,
    },
    {
      "<MouseMove>",
      function()
        require("hover").hover_mouse()
      end,
      desc = "General | Hover Mouse",
      silent = true,
    },
  },
  ---@module 'hover'
  ---@type Hover.UserConfig
  opts = {
    init = function()
      local is_executable = require("utils.executable").is_executable_cache

      require("hover.providers.lsp")
      if is_executable("gh") then
        require("hover.providers.gh")
        require("hover.providers.gh_user")
      end
      -- require('hover.providers.jira')
      require("hover.providers.dap")
      -- require('hover.providers.fold_preview')
      -- require('hover.providers.diagnostic')
      -- require('hover.providers.man')
      require("hover.providers.dictionary")
    end,
  },
}
