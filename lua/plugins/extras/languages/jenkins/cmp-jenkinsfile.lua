---@type NvPluginSpec
return {
  "joshzcold/cmp-jenkinsfile",
  ft = "jenkins",
  specs = {
    {
      "Saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
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
      },
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
