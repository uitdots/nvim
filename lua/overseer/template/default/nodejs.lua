---@module 'overseer'
---@type overseer.TemplateDefinition
return {
  name = "NodeJS Default",
  desc = "Run JS file with Node",
  builder = function()
    local file = vim.fn.expand("%:p")

    ---@type overseer.TaskDefinition
    return {
      cmd = { "node", file },
      components = {
        "default",
        "output",
      },
    }
  end,
  condition = {
    filetype = { "javascript" },
  },
  priority = -1,
}
