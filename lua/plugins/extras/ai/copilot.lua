local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local ai_suggestion_enabled = require("preferences").options.others.ai_suggestion_enabled

local function setup_autocmds()
  local group = augroup("CopilotCmp", { clear = true })
  local suggestion = require("copilot.suggestion")
  local client = require("copilot.client")
  autocmd("User", {
    group = group,
    pattern = "BlinkCmpMenuOpen",
    callback = function(args)
      if client.is_disabled() then
        return
      end
      vim.b[args.buf].copilot_suggestion_hidden = true
      -- suggestion.clear_preview()
    end,
  })
  autocmd("User", {
    group = group,
    pattern = "BlinkCmpMenuClose",
    callback = function(args)
      if client.is_disabled() then
        return
      end
      vim.b[args.buf].copilot_suggestion_hidden = false
      suggestion.update_preview()
    end,
  })
end

local function clear_autocmds()
  pcall(vim.api.nvim_del_augroup_by_name, "CopilotCmp")
end

---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  ---@module 'copilot'
  ---@type CopilotConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ---@diagnostic disable-next-line: missing-fields
    panel = {
      enabled = true,
    },
    ---@diagnostic disable-next-line: missing-fields
    suggestion = {
      enabled = true,
      auto_trigger = true,
      ---@diagnostic disable-next-line: missing-fields
      keymap = {
        accept_word = "<M-w>",
        accept_line = "<M-S-l>",
      },
    },
    server_opts_overrides = {
      settings = {
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
        require("copilot.suggestion").toggle_auto_trigger()
      end,
      desc = "Copilot | Toggle Buffer Suggestion",
      silent = true,
    },
    {
      "<leader>aT",
      function()
        local is_disabled = require("copilot.client").is_disabled()
        require("copilot.command")[is_disabled and "enable" or "disable"]()
        vim.notify("Copilot is " .. (is_disabled and "enabled" or "disabled"), vim.log.levels.INFO, {
          title = "Copilot",
          icon = "",
        })
        if is_disabled then
          setup_autocmds()
        else
          clear_autocmds()
        end
      end,
      desc = "Copilot | Toggle",
      silent = true,
    },
    {
      "<leader>ap",
      "<cmd>Copilot panel<cr>",
      desc = "Copilot | Toggle Panel",
      silent = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    if ai_suggestion_enabled then
      setup_autocmds()
    else
      require("copilot.command").disable()
    end
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
            local suggestion = require("copilot.suggestion")
            if suggestion.is_visible() then
              suggestion.accept()
              return true
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
