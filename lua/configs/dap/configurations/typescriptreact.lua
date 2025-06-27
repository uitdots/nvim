local dap = require("dap")
local dap_chrome = require("configs.dap.adapters.chrome")
local dap_firefox = require("configs.dap.adapters.firefox")
local javascriptreact_configurations = require("configs.dap.configurations.javascriptreact")

local M = {}

M.configurations = javascriptreact_configurations

function M.setup()
  local chrome_status = dap_chrome.setup()
  local firefox_status = dap_firefox.setup()

  local configs = {}

  if chrome_status then
    vim.list_extend(configs, M.configurations.chrome)
  end

  if firefox_status then
    vim.list_extend(configs, M.configurations.firefox)
  end

  if #configs > 0 then
    dap.configurations.javascriptreact = configs
  end
end

return M
