local get_executable = require("utils.executable").get_executable
local fts = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
}

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  opts = function()
    local adapter = get_executable("dapDebugServer.js", "packages/js-debug-adapter/js-debug/src")
    if adapter == nil then
      return
    end
    local dap = require("dap")
    local dap_utils = require("dap.utils")

    dap.adapters["pwa-node"] = {
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

    for _, ft in ipairs(fts) do
      dap.configurations[ft] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = dap_utils.pick_process,
          cwd = "${workspaceFolder}",
        },
      }
    end
  end,
  optional = true,
}
