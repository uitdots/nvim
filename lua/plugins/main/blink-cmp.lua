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
      preset = "luasnip",
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
        "fallback",
      },
      ["<Tab>"] = {
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
        "select_next",
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
        lsp = {
          fallbacks = { -- for extending, so I declare here
            "buffer",
          },
        },
      },
      per_filetype = {
        sql = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
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
    ---@type table<string, true>
    local exclude_inherit_fts = {
      sql = true,
    }
    for ft in pairs(per_filetype) do
      if not exclude_inherit_fts[ft] then
        per_filetype[ft].inherit_defaults = true
      end
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
      desc = "Options | Toggle Completion",
    },
  },
}
