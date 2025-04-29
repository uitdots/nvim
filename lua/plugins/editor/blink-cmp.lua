-- NOTE: https://github.com/NvChad/ui/tree/v3.0/lua/nvchad/blink
local uitvim_options = require("uitvim").options

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
    ---@param opts blink.cmp.Config?
    opts = function(_, opts)
      ---@type blink.cmp.Config
      local _opts = {
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
        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
              border = uitvim_options.border_enabled and "rounded" or "none",
            },
          },
          menu = require("nvchad.blink").menu,
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
        signature = {
          enabled = false,
        },
      }
      opts = vim.tbl_deep_extend("force", opts or {}, _opts)
      return opts
    end,
    config = function(_, opts)
      require("blink.cmp").setup(opts)
    end,
  },
}
