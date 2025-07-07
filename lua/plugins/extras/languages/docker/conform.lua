---@type LazySpec
return {
  "stevearc/conform.nvim",
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      dockerfile = {
        -- "hadolint", -- TODO: When conform support it
      },
    },
  },
  optional = true,
}
