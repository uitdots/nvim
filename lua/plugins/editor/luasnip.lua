---@type NvPluginSpec
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "v2.*",
  build = vim.g.os == "Windows" and "make install_jsregexp CC=gcc.exe SHELL=sh.exe .SHELLFLAGS=-c"
    or "make install_jsregexp",
  config = function(_, opts)
    require("luasnip").config.set_config(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
