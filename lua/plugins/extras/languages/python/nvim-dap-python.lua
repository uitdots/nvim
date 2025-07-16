-- TODO: This is ... when dap is not enabled. This will not work?
local is_windows = require("utils.os").is_windows
local get_executable = require("utils.executable").get_executable

---@type LazySpec
return {
  {
    "mfussenegger/nvim-dap-python",
    enabled = true,
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
      local executable = get_executable("uv")
      if executable == nil then
        executable = get_executable("python", { masons = string.format("debugpy/%s", is_windows and "venv/Scripts" or "/venv/bin") })
      end
      if executable == nil then
        return
      end
      ---@cast executable string
      require("dap-python").setup(executable)
    end,
    specs = {
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
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      optional = true,
    },
  },
}
