---@type LazySpec
return {
  "https://gitlab.com/msvechla/cmp-jira.git",
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
  config = function(_, opts)
    local env = vim.env

    if env.JIRA_USER_API_KEY == nil or env.JIRA_WORKSPACE_URL == nil or env.JIRA_USER_EMAIL == nil then
      vim.notify("Not enough environment variable provided to use cmp_jira, no setup", vim.log.levels.INFO, { title = "cmp_jira" })
      return
    end
    require("cmp_jira").setup(opts)
  end,
}
