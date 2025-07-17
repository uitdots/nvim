---@type LazySpec
return {
  "joshzcold/cmp-jenkinsfile",
  enabled = false,
  cond = vim.env.JENKINS_URL ~= nil,
  ft = "jenkins",
  specs = {
    {
      "Saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type fun(_, opts: blink.cmp.Config?): blink.cmp.Config
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          sources = {
            providers = {
              jenkinsfile = {
                name = "jenkinsfile",
                module = "blink.compat.source",
                opts = {
                  ---This is based on your jenkins server you write.
                  jenkins_url = vim.env.JENKINS_URL,
                  ---This is required if ...
                  http = {
                    basic_auth_user = vim.env.JENKINS_USER_ID,
                    basic_auth_password = vim.env.JENKINS_PASSWORD,
                    ca_cert = vim.env.JENKINS_CA_CERT,
                    proxy = vim.env.JENKINS_PROXY,
                  },
                },
              },
            },
            per_filetype = {
              jenkins = {
                inherit_defaults = true,
                "jenkinsfile",
              },
            },
          },
        })
      end,
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
