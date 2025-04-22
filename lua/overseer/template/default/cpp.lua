return {
  name = "c++ default runner",
  builder = function()
    local file = vim.fn.expand("%:p")
    local out = vim.fn.expand("%:p:r")
    return {
      cmd = { out },
      components = {
        {
          "dependencies",
          task_names = {
            {
              cmd = "g++",
              args = { file, "-o", out },
            },
          },
        },
        -- {
        --   "open_output",
        --   on_complete = "always", -- Options: "always", "never", "success", "failure"
        --   direction = "dock", -- Options: "dock", "float", "tab", "vertical", "horizontal"
        --   focus = true, -- Focus the output window when it opens
        -- },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
