---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  specs = {
    {
      "Davidyz/codecompanion-dap.nvim",
      enabled = false,
      dependencies = "mfussenegger/nvim-dap",
      specs = {
        {
          "olimorris/codecompanion.nvim",
          opts = {
            extensions = {
              dap = {
                enabled = true,
              },
            },
          },
        },
      },
    },
  },
}
