---@type LazySpec
return {
  "google/styleguide",
  name = "java-google-styleguide",
  module = false,
  specs = {
    {
      "mfussenegger/nvim-jdtls",
      ---@type NvimJdtlsOpts
      opts = {
        lspconfig = {
          settings = {
            java = {
              format = {
                enabled = true,
                settings = {
                  url = vim.fn.stdpath("data") .. "/lazy/java-google-styleguide/intellij-java-google-style.xml",
                  name = "GoogleStyle",
                },
              },
            },
          },
        },
      },
    },
  },
}
