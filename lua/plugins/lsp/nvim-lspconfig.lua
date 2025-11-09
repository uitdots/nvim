local filter_availabled_external = require("preferences").options.others.filter_availabled_external
local is_executable = require("utils.executable").is_executable
local lsp = require("configs.lsp")
local lsps = require("preferences").lsp.force

---@param server_name string
local function filter_executable(server_name)
  local success, result = pcall(function()
    is_executable(vim.lsp.config[server_name].cmd[1])
  end)
  return not success or result
end

local function setup_custom_lsps()
  for _, server_name in pairs(lsps) do
    if filter_availabled_external == false or filter_executable(server_name) then
      vim.lsp.config(server_name, lsp.opts)
      vim.lsp.enable(server_name)
    end
  end
end

---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "BufRead",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>li",
      "<cmd>LspInfo<cr>",
      desc = "LSP | Info",
      silent = true,
    },
  },
  config = function()
    lsp.setup()
    setup_custom_lsps()
  end,
}
