local util = require("lspconfig.util")

---@type vim.lsp.Config
return {
  ---@module 'lspconfig'
  ---@type lspconfig.settings.tailwindcss
  settings = nil,
  -- Taken from https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua
  -- Just because we don't want it to fallback to .git
  root_dir = function(bufnr, on_dir)
    local root_files = {
      -- Generic
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
      "postcss.config.mjs",
      "postcss.config.ts",
      -- Django
      "theme/static_src/tailwind.config.js",
      "theme/static_src/tailwind.config.cjs",
      "theme/static_src/tailwind.config.mjs",
      "theme/static_src/tailwind.config.ts",
      "theme/static_src/postcss.config.js",
    }
    local fname = vim.api.nvim_buf_get_name(bufnr)
    root_files = util.insert_package_json(root_files, "tailwindcss", fname)
    root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)
    on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
  end,
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = false,
      },
    },
  },
}
