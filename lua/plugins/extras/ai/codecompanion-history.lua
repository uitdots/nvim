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
            ---@type CodeCompanion.History.Opts
            opts = {
              auto_save = true,
              expiration_days = 7,
              picker = "snacks",
              continue_last_chat = false,
              delete_on_clearing_chat = false,
            },
          },
        },
      },
      dependencies = "ravitemer/codecompanion-history.nvim",
    },
  },
}
