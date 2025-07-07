---@type LazySpec
return {
  "ravitemer/codecompanion-history.nvim",
  specs = {
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
      dependencies = "ravitemer/codecompanion-history.nvim",
    },
  },
}
