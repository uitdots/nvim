-- NOTE: https://github.com/NvChad/ui/tree/v3.0/lua/nvchad/blink

---@module 'blink.cmp'

---@type NvPluginSpec
return {
  -- { import = "nvchad.blink.lazysec" },
  {
    "saghen/blink.cmp",
    event = {
      "InsertEnter",
      "CmdLineEnter",
    },
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
        ["<C-space>"] = {
          "show",
          "show_documentation",
          "hide_documentation",
        },
        ["<M-;>"] = { -- For windows terminal because <C-Space> is bruh?
          "show",
          "show_documentation",
          "hide_documentation",
        },
        ["<C-e>"] = {
          "hide",
          "fallback",
        },
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_active() then
              return cmp.select_next({ auto_insert = false })
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_active() then
              return cmp.select_prev({ auto_insert = false })
            end
          end,
          "snippet_backward",
          "fallback",
        },
        ["<Up>"] = {
          "select_prev",
          "fallback",
        },
        ["<Down>"] = {
          "select_next",
          "fallback",
        },
        ["<C-p>"] = {
          "select_prev",
          "fallback_to_mappings",
        },
        ["<C-n>"] = {
          "select_next",
          "fallback_to_mappings",
        },
        ["<C-b>"] = {
          "scroll_documentation_up",
          "fallback",
        },
        ["<C-f>"] = {
          "scroll_documentation_down",
          "fallback",
        },
        ["<C-k>"] = {
          "show_signature",
          "hide_signature",
          "fallback",
        },
        ["<CR>"] = {
          "select_and_accept",
          "fallback",
        },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
        providers = {
          -- https://cmp.saghen.dev/configuration/reference.html#providers
          -- Allow buffer even LSP has suggestions
          lsp = {
            fallbacks = {},
          },
          buffer = {
            score_offset = -5,
          },
        },
      },
      signature = { -- use blink's signature beside of noice. Triggered by <C-k>
        enabled = true,
        trigger = {
          show_on_insert = false,
        },
      },
    },
    ---@param opts blink.cmp.Config
    config = function(_, opts)
      opts.completion = opts.completion or {}
      opts.completion.menu = require("nvchad.blink").menu
      require("blink.cmp").setup(opts)
    end,
    keys = {
      {
        "<leader>oa",
        function()
          vim.b.completion = not vim.b.completion
          if vim.b.completion then
            vim.notify("Completion Disabled", vim.log.levels.INFO, { title = "Completion" })
          else
            vim.notify("Completion Enabled", vim.log.levels.INFO, { title = "Completion" })
          end
        end,
        desc = "Options | Toggle Completion",
      },
    },
  },
}
