---@type NvPluginSpec
return {
  {
    "ravitemer/codecompanion-history.nvim",
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      extensions = {
        history = {
          enabled = true,
          ---@module 'codecompanion._extensions.history'
          ---@type HistoryOpts
          opts = {
            auto_save = true,
            expiration_days = 7,
            picker = "snacks",
            continue_last_chat = true,
            delete_on_clearing_chat = false,
          },
        },
      },
    },
    dependencies = {
      "ravitemer/codecompanion-history.nvim",
    },
    optional = true,
  },
}
