local autocmd = vim.api.nvim_create_autocmd

---@type NvPluginSpec
return {
  "zbirenbaum/copilot.lua",
  enabled = true,
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
        telemetry = {
          telemetryLevel = "off",
        },
      },
    },
  },
  keys = {
    {
      "<leader>at",
      "<cmd>Copilot toggle<cr>",
      desc = "AI | Toggle Copilot",
      silent = true,
    },
    {
      "<leader>as",
      "<cmd>Copilot suggestion<cr>",
      desc = "AI | Toggle Copilot Sugesstion",
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
    require("copilot.command").disable()
  end,
  dependencies = {
    "saghen/blink.cmp",
    optional = true,
    ------TODO: Maybe should... check the disable diagnostic here
    ------
    ------@module 'blink.cmp'
    ------@param opts blink.cmp.Config?
    ------@return blink.cmp.Config
    ---opts = function(_, opts)
    ---  opts = opts or {}
    ---  opts.keymap = opts.keymap or {}
    ---
    ---  local copilot = {
    ---    function()
    ---      if not require("copilot.suggestion").is_visible() then
    ---        return require("copilot.suggestion").accept()
    ---      end
    ---    end,
    ---  }
    ---
    ---  if opts.keymap["<Tab>"] == nil then
    ---    opts.keymap["<Tab>"] = copilot
    ---  else
    ---    vim.list_extend(opts.keymap["<Tab>"], copilot, 1)
    ---  end
    ---
    ---  vim.print(opts)
    ---  return opts
    ---end,
    init = function()
      autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function()
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
  },
}
