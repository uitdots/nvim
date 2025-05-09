-- TODO: move those opts capabilities, bla bla to lspconfig

---@module 'snacks'

local is_executable = require("utils.executable").is_executable
local filter_availabled_external = require("uitvim").options.filter_availabled_external
local lspconfig = require("configs.lsp.lspconfig")

local M = {}

---@private
function M.setup_custom_lsps()
  local server_names = require("uitvim").lsps
  for _, server_name in pairs(server_names) do
    if
      filter_availabled_external == false
      or is_executable(require("lspconfig.configs." .. server_name).default_config.cmd[1])
    then
      vim.lsp.config(server_name, lspconfig.opts)
      vim.lsp.enable(server_name)
    end
  end
end

function M.setup()
  require("configs.lsp.lspconfig").setup()
  M.setup_custom_lsps()
end

return M
