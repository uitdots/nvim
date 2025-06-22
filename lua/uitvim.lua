local M = {}

---External lsp you want to setup.
---Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
---@type string[]
M.lsps = {
  "clangd",
  "lua_ls",
  "pyright",
  "texlab",
  "kotlin_lsp",
}

---For having lsp setup by mason (exclude these)
---@type string[]
M.no_setup_lsps = {
  "ts_ls",
  "dartls",
  "rust_analyzer",
  "jdtls",
  "sqls",
  "kotlin_language_server",
}

---@type {space: table<number, string[]>, tab: table<number, string[]>}
M.indent = {
  space = {
    [4] = {
      "c",
      "cpp",
      "cs",
      "python",
      "kotlin",
      "java",
    },
    [2] = {
      "just",
    },
  },
}

M.options = {
  ---Check lsp, linter, formatter avaibility. This is idea when you want to add many external stuff but filter out which is not available. This may cause [plugin's] startup slower but not really much, for about few milliseconds.
  ---@type boolean
  filter_availabled_external = true,

  inlay_hint = {
    ---Fallback for those language server that isn't declared in "servers" field below
    ---@type boolean
    server_default = true,

    ---Let some language server enable inlayhint.
    ---@type boolean | table<string, boolean> the key is the name of the lsp, and includes "sql"
    servers = true,

    ---Enable inlay hint in neovim (client)
    ---@type boolean
    client = false,
  },

  semantic_tokens = {
    ---Fallback for those language server that isn't declared in "servers" field below
    ---@type boolean
    server_default = true,

    ---Semantic tokens enabled or not for language server
    ---@type boolean | table<string, boolean> the key is the name of the lsp
    servers = {
      gopls = true,
      vtsls = false,
    },

    ---Enable semantic tokens for neovim
    ---@type boolean
    client = true,
  },

  ---Use border for... most of the thing related to UI. You can search for which use this options
  ---@type boolean
  border_enabled = true,

  ---Enable autoformat
  ---@type boolean
  autoformat_enabled = true,

  ---Enable AI suggestion
  ---@type boolean
  ai_suggestion_enabled = false,
}

return M
