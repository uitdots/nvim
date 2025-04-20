---@type NvPluginSpec
return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
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
      local executable = require("core.utils").get_executable("uv")
      if executable == nil then
        executable = require("core.utils").get_executable("python", {
          package = "debugpy",
          inner_path = vim.g.is_windows and "venv/Scripts" or "/venv/bin",
        })
      end
      if executable == nil then
        return
      end
      require("dap-python").setup(executable)
    end,
  },
}
