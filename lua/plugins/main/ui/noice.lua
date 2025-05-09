---@type NvPluginSpec
return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim",
    "MunifTanjim/nui.nvim",
  },
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
        enabled = true, -- FIXME: This may overlap current line
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
}
