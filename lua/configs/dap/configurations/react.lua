local dap = require("dap")
local dap_chrome = require("configs.dap.adapters.chrome")
local dap_firefox = require("configs.dap.adapters.firefox")

---@alias browser
---| '"chrome"'
---| '"firefox"'
---@type table<browser, dap.Configuration[]>
local configurations = {}

configurations.chrome = {
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

configurations.firefox = {
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

return function()
  local chrome_status = dap_chrome()
  local firefox_status = dap_firefox()

  local configs = {}

  if chrome_status then
    vim.list_extend(configs, configurations.chrome)
  end

  if firefox_status then
    vim.list_extend(configs, configurations.firefox)
  end

  if #configs > 0 then
    dap.configurations.javascriptreact = configs
    dap.configurations.typescriptreact = configs
  end
end
