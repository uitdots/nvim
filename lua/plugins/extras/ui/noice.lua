---@type LazySpec
return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  ---@module 'noice'
  ---@type NoiceConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    cmdline = {
      enabled = true,
    },
    messages = {
      enabled = true,
    },
    notify = {
      enabled = false,
    },
    lsp = {
      hover = {
        enabled = true,
      },
      signature = {
        enabled = false,
      },
      progress = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = false,
      inc_rename = false,
      lsp_doc_border = vim.o.winborder, -- May remove this in the future if noice use vim.o.winborder by default
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "folke/snacks.nvim",
      optional = true,
    },
  },
}
