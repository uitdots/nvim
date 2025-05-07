local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  {
    "JavaHello/spring-boot.nvim",
    cond = is_executable("jdtls"),
    ft = "java",
    opts = function()
      local opts = {
        init_options = {
          bundles = vim.list_extend({}, require("spring_boot").java_extensions()),
        },
      }
      return opts
    end,
    dependencies = {
      "mfussenegger/nvim-jdtls",
      {
        "ibhagwan/fzf-lua",
        optional = true,
      },
    },
  },
}
