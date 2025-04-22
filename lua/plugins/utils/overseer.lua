-- TODO: How to use this?

---@type NvPluginSpec
return {
  "stevearc/overseer.nvim",
  config = true,
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  opts = {
    dap = false,
    templates = { "builtin", "default" },
  },

  keys = {
    {
      "<leader>r",
      "<cmd>OverseerRun<cr>",
      desc = "Utils | Run Overseer tasks",
      silent = true,
    },
    {
      "<leader>R",
      "<cmd>OverseerToggle<cr>",
      desc = "Utils | Toggle Overseer",
      silent = true,
    },
  },
}
