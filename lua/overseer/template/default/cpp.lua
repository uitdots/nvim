local os_utils = require("utils.os")

---@module 'overseer'
---@type overseer.TemplateDefinition
return {
  name = "C++ Default",
  desc = "Compile C++ to executable and run",
  builder = function()
    local file = vim.fn.expand("%:p")
    local executable = vim.fn.expand("%:p:r")
    if os_utils.is_windows then
      executable = executable .. ".exe"
    end

    ---@type overseer.TaskDefinition
    return {
      cmd = executable,
      components = {
        {
          "dependencies",
          task_names = {
            {
              cmd = "g++",
              args = { file, "-o", executable },
            },
          },
        },
        "default",
        "output",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
  priority = -1,
}
