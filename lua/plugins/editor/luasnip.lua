---@type NvPluginSpec
return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "v2.*",
  build = not vim.g.is_windows and "make install_jsregexp"
    or "make install_jsregexp CC=gcc.exe SHELL=sh.exe .SHELLFLAGS=-c",
  config = function(_, opts)
    require("luasnip").config.set_config(opts)

    require("luasnip.loaders.from_vscode").lazy_load({
      path = {
        "snippets/vscode",
      },
    })

    -- Follow docs, because Honza's style
    require("luasnip").filetype_extend("all", { "_" })
    require("luasnip.loaders.from_snipmate").lazy_load({
      paths = {
        "./snippets/snipmate",
      },
    })
  end,
}
