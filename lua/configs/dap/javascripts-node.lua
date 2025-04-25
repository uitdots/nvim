local M = {}

function M._setup_adapter(adapter)
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = {
        adapter,
        "${port}",
      },
    },
  }
end

function M._config()
  require("dap").configurations.javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  }
end

function M.setup()
  local adapter = require("core.utils").get_executable("js-debug-adapter", { package = "js-debug-adapter" })
  if adapter == nil then
    return
  end
  M._setup_adapter(adapter)
  M._config()
end

return M
