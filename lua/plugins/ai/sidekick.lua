---@type LazySpec
return {
  "folke/sidekick.nvim",
  cmd = "Sidekick",
  keys = {
    {
      "<C-.>",
      function()
        require("sidekick.cli").toggle()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick | Toggle",
    },
    {
      "<leader>aC",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick | Toggle CLI",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select({ filter = { installed = true } })
      end,
      desc = "Sidekick | Select CLI",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Sidekick | Detach CLI Session",
    },
    {
      "<leader>aT",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Sidekick | Send This",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = "x",
      desc = "Sidekick | Send Selected",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Sidekick | Send File",
    },
    {
      "<leader>aP",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick | Select Prompt",
    },
  },
  ---@module 'sidekick'
  ---@type sidekick.Config
  opts = {
    copilot = {
      status = {
        enabled = false,
      },
    },
  },
}
