local dap = require("dap")
local dap_chrome = require("configs.dap.adapters.chrome")
local dap_firefox = require("configs.dap.adapters.firefox")

local M = {}

M.configurations = {}

M.configurations.chrome = {
  {
    type = "chrome",
    request = "attach",
    name = "React Chrome",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}

M.configurations.firefox = {
  {
    name = "React Firefox",
    type = "firefox",
    request = "launch",
    reAttach = true,
    url = "http://localhost:3000",
    webRoot = "${workspaceFolder}",
    firefoxExecutable = "firefox", -- TODO: Check does it need full path?
  },
}

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
