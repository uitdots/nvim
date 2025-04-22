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
      "<leader>rr",
      "<cmd>OverseerRun<cr>",
      desc = "Overseer | Run",
      silent = true,
    },
    {
      "<leader>rt",
      "<cmd>OverseerToggle<cr>",
      desc = "Overseer | Toggle",
      silent = true,
    },
    {
      "<leader>ro",
      "<cmd>OverseerOpen<cr>",
      desc = "Overseer | Open",
      silent = true,
    },
    {
      "<leader>rc",
      "<cmd>OverseerClose<cr>",
      desc = "Overseer | Close",
      silent = true,
    },
    {
      "<leader>ri",
      "<cmd>OverseerInfo<cr>",
      desc = "Overseer | Info",
      silent = true,
    },
    {
      "<leader>rb",
      "<cmd>OverseerBuild<cr>",
      desc = "Overseer | Build",
      silent = true,
    },
    {
      "<leader>rA",
      "<cmd>OverseerTaskAction<cr>",
      desc = "Overseer | Run task action",
      silent = true,
    },
    {
      "<leader>ra",
      "<cmd>OverseerQuickAction<cr>",
      desc = "Overseer | Run quick action",
      silent = true,
    },
    {
      "<leader>rs",
      "<cmd>OverseerSaveBundle<cr>",
      desc = "Overseer | Save Bundle",
      silent = true,
    },
    {
      "<leader>rl",
      "<cmd>OverseerLoadBundle<cr>",
      desc = "Overseer | Load Bundle",
      silent = true,
    },
    {
      "<leader>rd",
      "<cmd>OverseerDeleteBundle<cr>",
      desc = "Overseer | Delete Bundle",
      silent = true,
    },
  },
}
