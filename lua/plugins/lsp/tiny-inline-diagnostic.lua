---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  config = true,
  specs = {
    {
      "folke/sidekick.nvim",
      opts = function(_, opts)
        local autocmd = vim.api.nvim_create_autocmd

        autocmd("User", {
          pattern = "SidekickNesHide",
          callback = function()
            if vim.g.tiny_inline_diagnostic_disabled then
              vim.g.tiny_inline_diagnostic_disabled = false
              require("tiny-inline-diagnostic").enable()
            end
          end,
        })
        autocmd("User", {
          pattern = "SidekickNesShow",
          callback = function()
            vim.g.tiny_inline_diagnostic_disabled = true
            require("tiny-inline-diagnostic").disable()
          end,
        })
        return opts
      end,
      optional = true,
    },
  },
}
