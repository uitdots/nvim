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

---For excluding these lsps to be setup.
---Recommend to add them in the lua/plugins/extras/ai/languages. This is for your custom lsp
---@type string[]
M.no_setup_lsps = {
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

  ---Let some language server enable inlayhint.
  ---@type boolean
  lsp_inlayhint_enabled = true,

  ---Enable inlayhint in neovim
  ---This needs "lsp_inlayhint_enabled" (above).
  ---@type boolean
  inlayhint_enabled = false,

  ---Use border for... most of the thing related to UI. You can search for which use this options
  ---@type boolean
  border_enabled = true,

  ---Enable autoformat
  ---@type boolean
  autoformat_enabled = true,
}

return M
