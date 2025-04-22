-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "c++ default runner",
  builder = function()
    -- Full path to current file (see :help expand())
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
