-- /home/stevearc/.config/nvim/lua/overseer/template/user/run_script.lua
return {
  name = "go default runner",
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "go", "run", file },
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default.toggle", -- toggle overseer on complete
        "default",
      },
    }
  end,
  condition = {
    filetype = { "go" },
  },
}
