local M = {}

M.icon = nil

function M.set_icon()
  local os = vim.loop.os_uname().sysname
  local nvim_web_devicons = require("nvim-web-devicons")

  if os:match("Linux") then
    local f = io.open("/etc/os-release", "r")
    if f == nil then
      M.icon = nvim_web_devicons.get_icons_by_operating_system().linux.icon .. " "
      return
    end

    for line in f:lines() do
      local line_value = line:match([[^ID=(%w*)$]])
      if line_value then
        os = line_value
        break
      end
    end
  end

  os = os:lower()
  local os_object = nvim_web_devicons.get_icons_by_operating_system()[os]
  if os_object == nil then
    M.icon = ""
    return
  end
  M.icon = nvim_web_devicons.get_icons_by_operating_system()[os].icon .. " " or ""
end

function M.render()
  if M.icon == nil then
    M.set_icon()
  end

  return M.icon
end

return M.render
