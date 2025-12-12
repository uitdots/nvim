---@type LazySpec
return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerRun",
    "OverseerShell",
    "OverseerTaskAction",
  },
  ---You must not declare to patch the dap here, see below to patch dap
  ---@module 'overseer'
  ---@type overseer.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    templates = { "builtin", "default" },
    component_aliases = {
      output = {
        {
          "open_output",
          on_complete = "always",
          direction = "dock",
          focus = true,
        },
      },
    },
  },
  keys = {
    {
      "<leader>rr",
      "<cmd>OverseerRun<CR>",
      desc = "Overseer | Run",
      silent = true,
    },
    {
      "<leader>rt",
      "<cmd>OverseerToggle<CR>",
      desc = "Overseer | Toggle",
      silent = true,
    },
    {
      "<leader>ra",
      "<cmd>OverseerTaskAction<CR>",
      desc = "Overseer | Task Action",
      silent = true,
    },
    {
      "<leader>rs",
      "<cmd>OverseerShell<CR>",
      desc = "Overseer | Task Action",
      silent = true,
    },
    {
      "<leader>rl",
      "<cmd>OverseerRestartLast<CR>",
      desc = "Overseer | Restart Last",
      silent = true,
    },
  },
  init = function()
    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local overseer = require("overseer")
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, { desc = "Run last Overseer Task" })
  end,
  specs = {
    {
      "mfussenegger/nvim-dap",
      optional = true,
      opts = function()
        require("overseer").enable_dap(true)
      end,
    },
  },
}
