local g = vim.g

local sysname = vim.uv.os_uname().sysname
local os = sysname:match("Windows") and "Windows" or sysname:match("Linux") and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD,...
local is_windows = os == "Windows"

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
g.markdown_recommended_style = 0
g.mkdp_auto_close = false
g.snipmate_snippets_path = vim.fn.stdpath("config") .. "/snippets/snipmate"
g.vscode_snippets_path = vim.fn.stdpath("config") .. "/snippets/vscode"
g.skip_ts_context_commentstring_module = true
g.os = os
g.is_windows = is_windows
g.path_delimiter = is_windows and ";" or ":"
g.path_separator = is_windows and "\\" or "/"
vim.g.health = {
  style = nil, ---@type "float" | nil
}

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

g.markdown_filetypes = {
  "Avante",
  "markdown",
  "norg",
  "org",
  "rmd",
  "vimwiki",
}

if vim.g.inlayhint_default then
  vim.lsp.inlay_hint.enable(true)
end
