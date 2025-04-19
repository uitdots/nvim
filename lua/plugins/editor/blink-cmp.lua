-- NOTE: https://github.com/NvChad/ui/tree/v3.0/lua/nvchad/blink

---@module 'blink.cmp'

---@type NvPluginSpec
return {
  -- { import = "nvchad.blink.lazysec" },
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    ---@type blink.cmp.Config
    opts = {
      snippets = {
        preset = "luasnip",
      },
      appearance = {
        nerd_font_variant = "normal",
      },
      keymap = {
        preset = "super-tab",
        ["<CR>"] = {
          "select_and_accept",
          "fallback",
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = vim.g.border_enabled and "rounded" or "none",
          },
        },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          -- This is for custom provider
          "lazydev",
          "emoji",
          -- "copilot",
        },
      },
      signature = {
        enabled = false,
      },
    },
    config = function(_, opts)
      opts.completion.menu = require("nvchad.blink").menu
      require("blink.cmp").setup(opts)
    end,
  },
}
