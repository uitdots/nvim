local M = {}

---New LSP setup. If that lsp isn't in your $PATH, no problem, it won't break. If installed by Mason, yes it will be setup.
---Name taken from https://github.com/neovim/nvim-lspconfig/tree/master/lsp
---@type string[]
M.lsps = {
  "postgres_lsp",
  "lua_ls",
  "clangd",
  "pyright",
}

---Like above, but for old LSP setup method.
---This option will be removed in the future when nvim-lspconfig support all lsp in new way
---@type string[]
M.old_lsps = {
  "texlab",
}

---Useful for anyone who install using Mason but doesn't want to set them up.
---And, if you are using LSP wrappers that require not to config those LSPs (let them handle), then put those LSPs in here.
---@type string[]
M.no_setup_lsps = {
  "ts_ls",
  "dartls",
  "rust_analyzer",
  "jdtls",
  "sqls",
}

M.options = {
  ---Check lsp, linter, formatter avaibility. This is idea when you want to add many external stuff but filter out which is not available, then those plugin won't complain about avaibility of those. This may cause [plugin's] startup slower (but nah)
  ---@type boolean
  filter_availabled_external = true,
  ---Use inlayhint by default. This may cause lagging in neovim. But you can still enable inlayhint using keymap while using.
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
