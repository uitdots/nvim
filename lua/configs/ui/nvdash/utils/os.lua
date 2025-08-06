local M = {}

---@type string?
M.icon = nil

---@type table<string, string>
M.os_map = {
  Linux = "linux",
  Windows_NT = "windows",
  Darwin = "apple",
}

function M.set_icon()
  ---@module 'nvim-web-devicons'
  local nvim_web_devicons = require("nvim-web-devicons")

  ---@type string
  local os = vim.uv.os_uname().sysname

  ---@type string
  local os_icon_name

  if os == "Linux" then
    local f = io.open("/etc/os-release", "r")
    if f == nil then
      M.icon = nvim_web_devicons.get_icons_by_operating_system().linux.icon .. " "
      return
    end

    for line in f:lines() do
      ---@type string?
      local line_value = line:match([[^ID=(%w*)$]])
      if line_value then
        os_icon_name = line_value:lower()
        break
      end
    end
    f:close()
  else
    os_icon_name = M.os_map[os]
  end

  local os_object = nvim_web_devicons.get_icons_by_operating_system()[os_icon_name]
  if os_object == nil then
    M.icon = ""
    return
  end

  M.icon = os_object.icon .. " " or ""
end

return function()
  if M.icon == nil then
    M.set_icon()
  end
  return M.icon
end
