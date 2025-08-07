local is_windows = require("utils.os").is_windows

---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  keys = {
    {
      "<C-n>",
      "<Plug>luasnip-next-choice",
      desc = "Insert | LuaSnip Next Choice",
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<C-p>",
      "<Plug>luasnip-prev-choice",
      desc = "Insert | LuaSnip Prev Choice",
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<M-e>",
      function()
        if require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        end
      end,
      desc = "Insert | LuaSnip Expand or Jump",
      silent = true,
      mode = { "i", "s" },
      noremap = true,
    },
    {
      "<M-c>",
      function()
        if require("luasnip").choice_active() then
          require("luasnip.extras.select_choice")()
        end
      end,
      desc = "Insert | LuaSnip Open Select Choice",
      silent = true,
      mode = { "i", "s" },
    },
  },
  build = not is_windows and "make install_jsregexp" or "make install_jsregexp CC=gcc.exe SHELL=sh.exe .SHELLFLAGS=-c",
  config = function(_, opts)
    require("luasnip").config.set_config(opts)

    require("luasnip.loaders.from_lua").lazy_load({
      lazy_paths = {
        "snippets/luasnippets",
      },
    })

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
  dependencies = "rafamadriz/friendly-snippets",
  specs = {
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        snippets = {
          preset = "luasnip",
        },
      },
      optional = true,
    },
  },
}
