local autocmd = vim.api.nvim_create_autocmd
local ai_suggestion_enabled = require("preferences").options.others.ai_suggestion_enabled

---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
    },
    server_opts_overrides = {
      settings = {
        advanced = {
          inlineSuggestCount = 1, -- Hehe I dont need it to generate more, just be fast
        },
        telemetry = {
          telemetryLevel = "off",
        },
      },
    },
  },
  keys = {
    {
      "<leader>at",
      function()
        vim.g.copilot_enabled = not vim.g.copilot_enabled
        if vim.g.copilot_enabled then
          require("copilot.command").enable()
          vim.notify("Copilot completion is enabled", vim.log.levels.INFO, {
            title = "Copilot",
          })
        else
          require("copilot.command").disable()
          vim.notify("Copilot completion is disabled", vim.log.levels.INFO, {
            title = "Copilot",
          })
        end
      end,
      desc = "AI | Toggle Completion (Copilot)",
      silent = true,
    },
    {
      "<leader>ap",
      "<cmd>Copilot panel<cr>",
      desc = "AI | Toggle Copilot Panel",
      silent = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    if not ai_suggestion_enabled then
      vim.g.copilot_enabled = false
      pcall(function()
        require("copilot.command").disable()
      end)
    else
      vim.g.copilot_enabled = true
    end

    autocmd("User", {
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        require("copilot.suggestion").dismiss()
        vim.b.copilot_suggestion_hidden = true
      end,
    })

    autocmd("User", {
      pattern = "BlinkCmpMenuClose",
      callback = function()
        vim.b.copilot_suggestion_hidden = false
      end,
    })
  end,
  dependencies = {
    "saghen/blink.cmp",
    optional = true,
  },
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@param opts blink.cmp.Config?
      ---@return blink.cmp.Config
      opts = function(_, opts)
        opts = opts or {}
        opts.keymap = opts.keymap or {}

        local copilot = {
          function()
            if vim.g.copilot_enabled and require("copilot.suggestion").is_visible() then
              return require("copilot.suggestion").accept()
            end
          end,
        }

        if opts.keymap["<Tab>"] == nil then
          opts.keymap["<Tab>"] = copilot
        else
          vim.list_extend(opts.keymap["<Tab>"], copilot, 1)
        end

        return opts
      end,
      optional = true,
    },
  },
}
