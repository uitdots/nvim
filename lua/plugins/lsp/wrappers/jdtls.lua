---@type NvPluginSpec
return {
  "mfussenegger/nvim-jdtls",
  cond = vim.fn.executable("jdtls") == 1,
  ft = "java",
}
