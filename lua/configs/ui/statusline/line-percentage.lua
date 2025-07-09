local M = {}

---@private
---@type string?
M.state = nil

local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group, sep_l, sep_end)
  return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_end
end

local function set_state()
  local config = require("nvconfig").ui.statusline
  local theme = config.theme

  local sep_style = config.separator_style

  local mode = {
    default = {
      default = { left = "", right = "" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "", right = "" },
    },
    minimal = {
      default = { left = "█", right = "█" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "█", right = "█" },
    },
    vscode = {
      default = { left = "█", right = "█" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "", right = "" },
    },
    vscode_colored = {
      default = { left = "█", right = "█" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "", right = "" },
    },
  }

  local separators = (type(sep_style) == "table" and sep_style) or mode[theme][sep_style]

  local sep_l = separators["left"]
  local sep_end = "%#St_sep_r#" .. separators["right"]

  if theme == "default" then
    M.state = "%#St_Percent_sep#" .. sep_l .. "%#St_Percent_icon# %#St_Percent_text# %p %% "
    return
  elseif theme == "vscode" or theme == "vscode_colored" then
    M.state = "%#StText# %L"
    return
  end

  M.state = gen_block("", "%L", "%#St_Percent_sep#", "%#St_Percent_bg#", "%#St_Percent_txt#", sep_l, sep_end)
end

---@return string?
return function()
  if M.state == nil then
    set_state()
  end

  return M.state
end
