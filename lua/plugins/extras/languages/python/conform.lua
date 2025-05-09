---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      python = {
        "ruff_fix",
        "ruff_format",
        -- "ruff_organize_imports", -- Should be set in config, so that ruff_fix can do that
      },
    },
  },
  optional = true,
}
