local ai_suggestion_enabled = require("preferences").options.others.ai_suggestion_enabled

---@type LazySpec
return {
  "folke/sidekick.nvim",
  cmd = "Sidekick",
  event = ai_suggestion_enabled and {
    "BufRead",
    "BufNewFile",
  } or nil,
  keys = {
    {
      "<Tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>"
        end
      end,
      expr = true,
      desc = "Sidekick | Goto/Apply Next Edit Suggestion",
    },
    {
      "<leader>an",
      function()
        local nes = require("sidekick.nes")
        nes.toggle()
        vim.notify("Sidekick NES is " .. (nes.enabled and "enabled" or "disabled"), vim.log.levels.INFO, {
          title = "Sidekick",
          icon = "",
        })
      end,
      mode = { "x", "n" },
      desc = "Sidekick | Toggle NES",
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
      "<leader>a<C-t>",
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
      "<leader>aP",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick | Select Prompt",
    },
    {
      "<C-.>",
      function()
        require("sidekick.cli").focus()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick | Switch Focus",
    },
  },
  ---@module 'sidekick'
  ---@type sidekick.Config
  opts = {
    nes = {
      enabled = ai_suggestion_enabled,
    },
    copilot = {
      status = {
        enabled = false,
      },
    },
  },
  dependencies = "zbirenbaum/copilot.lua",
}
