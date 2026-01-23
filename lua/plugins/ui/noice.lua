---@type LazySpec
return {
  "folke/noice.nvim",
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
      view_search = false,
    },
    notify = {
      enabled = false,
    },
    popupmenu = {
      enabled = false,
    },
    lsp = {
      hover = {
        enabled = true,
        silent = true,
      },
      documentation = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      progress = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
    routes = {
      -- https://github.com/folke/noice.nvim/issues/1097
      {
        filter = {
          event = "msg_show",
          kind = { "shell_out", "shell_err" },
        },
        view = "notify",
        opts = {
          level = "info",
          skip = false,
          replace = false,
        },
      },
    },
    health = {
      checker = false,
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = false,
      inc_rename = false,
      lsp_doc_border = vim.o.winborder, -- May remove this in the future if noice use vim.o.winborder by default
    },
  },
  opts_extend = {
    "routes",
  },
  dependencies = "MunifTanjim/nui.nvim",
}
