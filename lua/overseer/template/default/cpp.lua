return {
  name = "c++ default runner",
  builder = function()
    local file = vim.fn.expand("%:p")
    local out = vim.fn.expand("%:p:r")
    return {
      cmd = { out },
      components = {
        { "dependencies", task_names = { { cmd = "g++", args = { file, "-o", out } } } },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
