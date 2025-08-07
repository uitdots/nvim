-- WARN: You need to fill all of them. Even empty list/table

---@type Preferences
local M = {
  lsp = {
    force = {
      "sonarlint", -- NOTE: nvim-lspconfig doesn't support it yet
    },
    exclude = {
      "ts_ls",
      "dartls",
      "rust_analyzer",
      "jdtls",
      "sqls",
    },
  },

  options = {
    indent = {
      default = 2,
      space = {
        [4] = {
          "c",
          "cpp",
          "cs",
          "groovy",
          "java",
          "jenkins",
          "kotlin",
          "python",
        },
        [2] = {
          "just",
        },
      },
      tab = {},
    },

    wrap = {
      default = true,
      revert = {
        "grug-far",
        "lazy",
        "log",
        "markdown",
        "mason",
      },
    },

    inlay_hint = {
      server_default = true,
      servers = true,
      client = false,
    },

    semantic_tokens = {
      server_default = true,
      servers = {
        gopls = true,
        vtsls = false,
      },
      client = true,
    },

    others = {
      auto_format_enabled = true,
      ai_suggestion_enabled = false,
      filter_availabled_external = true,
    },
  },
}

return M
