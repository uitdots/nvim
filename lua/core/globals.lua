-- TODO: May cleanup this later
local uitvim_options = require("uitvim").options
local g = vim.g

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
g.markdown_recommended_style = 0
vim.g.health = {
  style = nil, ---@type "float" | nil
}

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

g.autoformat_enabled = uitvim_options.autoformat_enabled

g.markdown_filetypes = {
  "Avante",
  "markdown",
  "norg",
  "org",
  "rmd",
  "vimwiki",
}

vim.lsp.inlay_hint.enable(uitvim_options.inlayhint_enabled)
