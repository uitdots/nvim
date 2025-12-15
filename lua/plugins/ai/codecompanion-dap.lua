---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  specs = {
    {
      "Davidyz/codecompanion-dap.nvim",
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
