---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters = {
      ["markdown-toc"] = {
        append_args = {
          "--bullets=-",
        },
      },
      doctoc = {
        append_args = {
          "--update-only",
        },
      },
    },
    formatters_by_ft = {
      ["markdown.mdx"] = {
        "prettier",
        "doctoc",
      },
      markdown = {
        "prettier",
        "injected",
        "doctoc",
      },
    },
  },
  optional = true,
}
