-- I disable this plugin because I think it's enough to use normally :v

-- local filter_availabled_external = require("uitvim").options.others.
-- local is_executable = require("utils.executable").is_executable
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

---@type LazySpec
return {
  "ray-x/go.nvim",
  enabled = false,
  -- enabled = not filter_availabled_external or is_executable("go"),
  event = {
    "CmdlineEnter",
  },
  ft = {
    "go",
    "gomod",
  },
  opts = {
    lsp_inlay_hints = {
      enable = false,
    },
    diagnostic = false,
    null_ls = {
      golangci_lint = false,
      gotest = false,
    },
    trouble = true,
    luasnip = true,
  },
  init = function()
    local autocmd_group = augroup("GoFmtAndImport", {})

    autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").gofmt()
      end,
      group = autocmd_group,
    })
  end,
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
}
