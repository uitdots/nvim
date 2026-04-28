local dap = require("dap")
local chrome = require("configs.dap.adapters.chrome")
local firefox = require("configs.dap.adapters.firefox")

local configurations = {
  javascriptreact = {
    {
      type = "chrome",
      request = "attach",
      name = "React Chrome",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "firefox",
      request = "launch",
      name = "React Firefox",
      reAttach = true,
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      firefoxExecutable = "firefox",
    },
  },
}

return function()
  local configs = {}
  if chrome() then
    table.insert(configs, configurations.javascriptreact[1])
  end
  if firefox() then
    table.insert(configs, configurations.javascriptreact[2])
  end
  if #configs > 0 then
    dap.configurations.javascriptreact = configs
    dap.configurations.typescriptreact = configs
  end
end