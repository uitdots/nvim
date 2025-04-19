-- NOTE: https://github.com/NvChad/ui/tree/v3.0/lua/nvchad/blink

---@module 'blink.cmp'

---@type NvPluginSpec
return {
  -- { import = "nvchad.blink.lazysec" },
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    ------@param opts blink.cmp.Config & { sources: { default: string[] } }
    ---opts = function(_, opts)
    ---  opts = vim.tbl_deep_extend("force", opts or {}, {
    ---    snippets = { preset = "luasnip" },
    ---    appearance = { nerd_font_variant = "normal" },
    ---    keymap = {
    ---      preset = "super-tab",
    ---      ["<CR>"] = { "select_and_accept", "fallback" },
    ---    },
    ---    completion = {
    ---      menu = require("nvchad.blink").menu,
    ---      documentation = {
    ---        auto_show = true,
    ---        auto_show_delay_ms = 200,
    ---        window = {
    ---          border = vim.g.border_enabled and "rounded" or "none",
    ---        },
    ---      },
    ---    },
    ---    -- sources = {
    ---    --   default = {
    ---    --     "lsp",
    ---    --     "path",
    ---    --     "snippets",
    ---    --     "buffer",
    ---    --   },
    ---    -- },
    ---    signature = {
    ---      enabled = false,
    ---    },
    ---  })
    ---
    ---  opts.sources = opts.sources or {}
    ---  opts.sources.default = opts.sources.default or {}
    ---
    ---  opts.sources.default = vim.list_extend(opts.sources.default, { "lsp", "path", "snippets", "buffer" })
    ---end,

    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = "luasnip" },
      appearance = { nerd_font_variant = "normal" },
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "select_and_accept", "fallback" },
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
  {
    "moyiz/blink-emoji.nvim",
    enabled = true,
    dependencies = {
      "saghen/blink.cmp",
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            emoji = {
              module = "blink-emoji",
              name = "Emoji",
              score_offset = 15, -- Tune by preference
              opts = { insert = true }, -- Insert emoji (default) or complete its name
              should_show_items = function()
                return vim.tbl_contains(
                  -- Enable emoji completion only for git commits and markdown.
                  -- By default, enabled for all file-types.
                  { "gitcommit", "markdown" },
                  vim.o.filetype
                )
              end,
            },
          },
        },
      },
    },
  },
}
