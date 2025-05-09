---@type NvPluginSpec
return {
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
    "mfussenegger/nvim-jdtls",
    optional = true,
  },
}
