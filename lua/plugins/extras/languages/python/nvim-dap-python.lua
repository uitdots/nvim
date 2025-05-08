-- TODO: This is ... when dap is not enabled. This will not work?
local is_windows = require("utils.os").is_windows

---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap-python",
  keys = {
    {
      "<leader>dt",
      function()
        require("dap-python").test_method()
      end,
      desc = "Debug | Test Method",
      ft = "python",
    },
    {
      "<leader>dC",
      function()
        require("dap-python").test_class()
      end,
      desc = "Debug | Test Class",
      ft = "python",
    },
  },
  config = function()
    local executable = require("utils.executable").get_executable("uv")
    if executable == nil then
      executable = require("utils.executable").get_executable("python", {
        package = "debugpy",
        inner_path = is_windows and "venv/Scripts" or "/venv/bin",
      })
    end
    if executable == nil then
      return
    end
    require("dap-python").setup(executable)
  end,
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "jay-babu/mason-nvim-dap.nvim",
      optional = true,
      opts = {
        handlers = {
          python = function() end,
        },
      },
    },
  },
}
