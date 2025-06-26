---@type NvPluginSpec
return {
  {
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
    ---You must not declare to patch the dap here, see below to patch dap
    ---@module 'overseer'
    ---@type overseer.Config
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
        desc = "Overseer | Run Task Action",
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
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      pcall(function()
        require("overseer").enable_dap(true)
      end)
    end,
  },
}
