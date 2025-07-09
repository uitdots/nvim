---@type LazySpec
return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  ---@module 'dropbar'
  ---@type dropbar_configs_t
  opts = {
    -- TODO: Maybe filter for java kotlin
    sources = {
      path = {
        -- max_depth = 16,
      },
    },
    bar = {
      truncate = true,
    },
  },
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    optional = true,
  },
}
