---@type NvPluginSpec
return {
  "JavaHello/spring-boot.nvim",
  optional = true,
  cond = vim.fn.glob("~/.vscode/extensions/vmware.vscode-spring-boot*") ~= "",
  ft = {
    "java",
    "yaml",
    "jproperties",
  },
  config = function() end, -- TODO: when lazynvim fix the type of false...
}
