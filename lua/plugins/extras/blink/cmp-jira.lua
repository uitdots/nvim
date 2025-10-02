---@type LazySpec
return {
  "https://gitlab.com/msvechla/cmp-jira.git",
  cond = vim.env.JIRA_USER_API_KEY ~= nil,
  ft = "gitcommit",
  specs = {
    {
      "Saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            cmp_jira = {
              async = true,
              name = "cmp_jira",
              module = "blink.compat.source",
            },
          },
          per_filetype = {
            gitcommit = {
              "cmp_jira",
            },
          },
        },
      },
      opts_extend = {
        "sources.per_filetype.gitcommit",
      },
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
