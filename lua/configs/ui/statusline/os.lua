local icons = require("nvim-web-devicons").get_icons_by_operating_system()

local function render()
  local os = vim.loop.os_uname().sysname

  if os:match("Linux") then
    local f = io.open("/etc/os-release", "r")
    if not f then
      return ""
    end

    for line in f:lines() do
      local name = line:match('^NAME="?([^"\n]+)"?')
      if name then
        os = name
        break
      end
    end
  end

  os = (os or ""):lower()

  for os_name, icon_data in pairs(icons) do
    if not os_name:match("linux") and os:match(os_name) then
      return " " .. icon_data.icon .. " "
    end
  end

  return ""
end

return render
