---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      ["markdown.mdx"] = {
        "prettier",
        "doctoc",
      },
      markdown = {
        "prettier",
        "doctoc",
      },
    },
  },
  optional = true,
}
