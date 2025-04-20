-- Go to this to grab color
-- base46/lua/base46/integrations/statusline/default.lua

local M = {}

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

M.modules = {
  total_lines = function()
    local separators = {}
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

    separators = (type(sep_style) == "table" and sep_style) or mode[theme][sep_style]

    local sep_l = separators["left"]
    local sep_end = "%#St_sep_r#" .. separators["right"]

    -- From: NvChad/ui
    local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
      return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_end
    end

    if theme == "default" then
      return "%#St_Percent_sep#" .. sep_l .. "%#St_Percent_icon# %#St_Percent_text# %p %% "
    elseif theme == "vscode" or theme == "vscode_colored" then
      return "%#StText# %L"
    end
    return gen_block("", "%L", "%#St_Percent_sep#", "%#St_Percent_bg#", "%#St_Percent_txt#")
  end,

  command = function()
    local ok, result = pcall(function()
      local noice = require("noice.api")
      ---@diagnostic disable-next-line: undefined-field
      return "󰌌 " .. noice.status.command.get() .. " "
    end)
    return ok and result or " "
  end,

  python_venv = function()
    if vim.bo.filetype ~= "python" then
      return " "
    end

    local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or " "
    if venv == " " then
      return " "
    else
      -- return "  " .. venv
      return "%#St_gitIcons# "
    end
  end,

  macro_recording = function()
    return vim.fn.reg_recording() ~= "" and "%#St_cwd_sep# " or ""
  end,

  auto_format = function()
    if vim.b.disable_autoformat == false or (vim.b.disable_autoformat == nil and vim.g.disable_autoformat == false) then
      return "%#St_Lsp#󰁨 "
    end
    return ""
  end,

  eol_char = function()
    local eol = vim.bo.fileformat == "unix" and "lf" or vim.bo.fileformat == "dos" and "crlf" or "cr"
    return "| %#St_gitIcons#" .. eol .. " "
  end,

  lsps = function()
    local clients = {}
    local bufnr = vim.api.nvim_get_current_buf()
    local lsps = vim.lsp.get_clients({ bufnr = bufnr })

    if #lsps == 0 then
      return ""
    end

    if vim.o.columns < 100 then
      return " %#St_gitIcons# "
    end

    for _, lsps_names in pairs(lsps) do
      table.insert(clients, lsps_names.name)
    end

    return " %#St_gitIcons# " .. table.concat(clients, ", ") .. " "
  end,

  linters = function()
    local lint_ok, lint = pcall(require, "lint")
    if not lint_ok then
      return ""
    end

    local linters = lint._resolve_linter_by_ft(vim.bo.filetype)
    if #linters == 0 then
      return ""
    end

    if vim.o.columns < 100 then
      return " %#St_gitIcons#  "
    end

    return " %#St_gitIcons# " .. table.concat(linters, ", ") .. " "
  end,

  formatters = function()
    local conform_ok, conform = pcall(require, "conform")
    if not conform_ok then
      return ""
    end

    local formatters = conform.list_formatters(0)
    if #formatters == 0 then
      return ""
    end

    if vim.o.columns < 100 then
      return " %#St_gitIcons#  "
    end

    local formatters_names = {}

    for _, formatter in pairs(formatters) do
      table.insert(formatters_names, formatter.name)
    end

    return " %#St_gitIcons# " .. table.concat(formatters_names, ", ") .. " "
  end,

  flutter = function()
    if vim.g.flutter_tools_decorations and vim.g.flutter_tools_decorations.app_version then
      return "%#St_gitIcons# " .. (vim.o.columns > 100 and vim.g.flutter_tools_decorations.app_version or "") .. " "
    else
      return ""
    end
  end,
}

return M
