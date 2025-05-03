local M = {}

---@private
--- Source:
--- - https://github.com/hown3d
--- - https://github.com/Alexis12119/nvim-config
M.substitute = function(cmd)
  cmd = cmd:gsub("%%", vim.fn.expand("%"))
  cmd = cmd:gsub("$fileBase", vim.fn.expand("%:r"))
  cmd = cmd:gsub("$filePath", vim.fn.expand("%:p"))
  cmd = cmd:gsub("$file", vim.fn.expand("%"))
  cmd = cmd:gsub("$dir", vim.fn.expand("%:p:h"))
  cmd = cmd:gsub("#", vim.fn.expand("#"))
  cmd = cmd:gsub("$altFile", vim.fn.expand("#"))

  return cmd
end

---@param open_term fun(cmd:string)
function M.run(open_term)
  local supported, cmds = pcall(function()
    return require("configs.code-runner." .. vim.bo.ft)
  end)

  if not supported then
    vim.notify("Unsupported filetype for code runner", vim.log.levels.ERROR, { title = "Code Runner" })
  end

  ---@cast cmds table<string,string>
  local choices = vim.tbl_keys(cmds)
  ---@cast choices string[]
  if #choices == 1 then
    local cmd = cmds[choices[1]]
    local parsed_cmd = M.substitute(cmd)
    open_term(parsed_cmd)
  else
    vim.ui.select(choices, { prompt = "Choose a command to run code" }, function(choice)
      local cmd = cmds[choice]
      local parsed_cmd = M.substitute(cmd)
      open_term(parsed_cmd)
    end)
  end
end

return M
