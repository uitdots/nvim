---@type LazySpec
return {
  "not-manu/filemention.nvim",
  event = "InsertEnter",
  ---@module 'filemention'
  ---@type filemention.Config
  opts = {
    filetypes = {},
  },
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink-cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            filemention = {
              name = "filemention",
              module = "filemention.sources.blink",
            },
          },
          per_filetype = {
            gitcommit = {
              "filemention",
            },
            markdown = {
              "filemention",
            },
            text = {
              "filemention",
            },
            typst = {
              "filemention",
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.gitcommit",
        "sources.per_filetype.markdown",
        "sources.per_filetype.text",
        "sources.per_filetype.typst",
      },
    },
    {
      "dmtrKovalenko/fff.nvim",
      optional = true,
      specs = {
        {
          "not-manu/filemention.nvim",
          opts = {
            finder = "fff",
          },
        },
      },
    },
  },
}
