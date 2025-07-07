---@diagnostic disable: missing-fields
---@module 'neoconf'

local gcc_path = require("utils.executable").get_path_from_executable("gcc")

---@type vim.lsp.Config
return {
  cmd = {
    "clangd",
    "--all-scopes-completion",
    -- "--suggest-missing-includes",
    -- "--background-index",
    -- "--pch-storage=disk",
    -- "--cross-file-rename",
    -- "--log=info",
    -- "--completion-style=detailed",
    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
    "--clang-tidy",
    "--offset-encoding=utf-16",
    -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    "--fallback-style=Microsoft",
    -- "--header-insertion=never",
    -- "--query-driver=<list-of-white-listed-complers>"
    gcc_path ~= nil and "--query-driver=" .. gcc_path .. "*" or nil,
    "--inlay-hints=true",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
  },
}
