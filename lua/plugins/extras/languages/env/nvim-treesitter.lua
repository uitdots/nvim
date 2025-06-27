---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      "bash",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  init = function()
    vim.treesitter.language.register("bash", "dotenv")
  end,
  optional = true,
}
