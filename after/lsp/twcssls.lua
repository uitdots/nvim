-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/cssls.lua

local util = require("lspconfig.util")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "css-language-server"
    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "css", "scss", "less" },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  root_dir = function(bufnr, on_dir)
    local root_files = {
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
      "postcss.config.mjs",
      "postcss.config.ts",
      "theme/static_src/tailwind.config.js",
      "theme/static_src/tailwind.config.cjs",
      "theme/static_src/tailwind.config.mjs",
      "theme/static_src/tailwind.config.ts",
      "theme/static_src/postcss.config.js",
      ".git",
    }
    local fname = vim.api.nvim_buf_get_name(bufnr)
    root_files = util.insert_package_json(root_files, "tailwindcss", fname)
    root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)
    on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
  end,
  ---@type lspconfig.settings.cssls
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
