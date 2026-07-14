---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  specs = {
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
                ---@diagnostic disable-next-line: missing-fields
                memory = {
                  auto_create_memories_on_summary_generation = false,
                },
                title_generation_opts = {
                  adapter = "copilot",
                  model = "gpt-4.1",
                },
                summary = {
                  generation_opts = {
                    adapter = "copilot",
                    model = "gpt-4.1",
                  },
                },
              },
            },
          },
        },
        dependencies = "ravitemer/codecompanion-history.nvim",
      },
    },
  },
  optional = true,
}
