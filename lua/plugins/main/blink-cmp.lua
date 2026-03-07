---@type table<string, false>
local exclude_omni_filetypes = {
  sql = false,
  pgsql = false,
}

---@type LazySpec
return {
  "saghen/blink.cmp",
  event = {
    "InsertEnter",
    "CmdLineEnter",
  },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = "normal",
    },
    snippets = {
      score_offset = -5,
    },
    keymap = {
      preset = "none",
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
        function()
          if not package.loaded["copilot"] then
            return
          end
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            suggestion.clear_preview()
            return true
          end
        end,
        function()
          if not package.loaded["copilot"] then
            return
          end
          local suggestion = require("copilot.suggestion")
          if not suggestion.is_visible() then
            suggestion.update_preview()
            return true
          end
        end,
        "fallback",
      },
      ["<Tab>"] = {
        "select_next",
        function()
          if not package.loaded["copilot"] then
            return
          end
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            suggestion.accept()
            return true
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
      ["<C-p>"] = {
        "select_prev",
        "fallback",
      },
      ["<C-n>"] = {
        "select_next",
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
      ["<C-b>"] = {
        "scroll_documentation_up",
        "fallback",
      },
      ["<C-f>"] = {
        "scroll_documentation_down",
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
        "omni",
      },
      providers = {
        omni = {
          enabled = function()
            return exclude_omni_filetypes[vim.bo.filetype]
          end,
        },
        lsp = {
          fallbacks = { -- for extending, so I declare here
            "buffer",
          },
        },
      },
    },
    completion = {
      documentation = {
        treesitter_highlighting = true,
      },
    },
  },
  opts_extend = {
    "sources.default",
    "sources.per_filetype.sql",
    "sources.providers.lsp.fallbacks",
  },
  ---@param opts blink.cmp.Config
  config = function(_, opts)
    local per_filetype = opts.sources.per_filetype
    for ft in pairs(per_filetype) do
      per_filetype[ft].inherit_defaults = true
    end
    require("blink.cmp").setup(opts)
  end,
  keys = {
    {
      "<leader>oa",
      function()
        vim.b.completion = not vim.b.completion
        vim.notify("Completion " .. vim.b.completion("Enabled") and "Disabled", vim.log.levels.INFO, {
          title = "Completion",
          icon = "",
        })
      end,
      desc = "Blink | Toggle Completion",
      silent = true,
    },
  },
  specs = {
    {
      "L3MON4D3/LuaSnip",
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
        },
      },
      optional = true,
    },
  },
}
