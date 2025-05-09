local is_executable = require("utils.executable").is_executable

---@type NvPluginSpec
return {
  {
    "nvim-java/nvim-java",
    cond = is_executable("jdtls"),
  },
  {
    "JavaHello/spring-boot.nvim",
    cond = vim.fn.glob("~/.vscode/extensions/vmware.vscode-spring-boot*") ~= "",
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
      "nvim-java/nvim-java",
      optional = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-java/nvim-java",
      optional = true,
    },
  },
}
