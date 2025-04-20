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
    local noice_ok, noice = pcall(require, "noice.api")
    if noice_ok then
      ---@diagnostic disable-next-line: undefined-field
      return " %#St_gitIcons#" .. noice.status.command.get() .. " "
    else
      return " "
    end
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
    local buf = vim.api.nvim_get_current_buf()

    -- Iterate through all the clients for the current buffer
    for _, client in pairs(vim.lsp.get_clients({ bufnr = buf })) do
      -- Add the client name to the `clients` table
      table.insert(clients, client.name)
    end

    if #clients == 0 then
      return ""
    else
      return " %#St_gitIcons# " .. (vim.o.columns > 100 and table.concat(clients, ", ") or "") .. " "
    end
  end,

  linters = function()
    local clients = {}

    local lint_ok, lint = pcall(require, "lint")
    if lint_ok then
      local linters = {}
      local fts = vim.split(vim.bo.filetype, ".", { plain = true, trimempty = true })
      for _, ft in pairs(fts) do
        vim.list_extend(linters, lint.linters_by_ft[ft] or {})
      end
      if #linters ~= 0 then
        table.insert(clients, table.concat(linters, ", "))
      end
    end

    if #clients == 0 then
      return ""
    else
      return " %#St_gitIcons# " .. (vim.o.columns > 100 and table.concat(clients, ", ") or "") .. " "
    end
  end,

  formatters = function()
    local clients = {}

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
      local formatters = conform.list_formatters(0)
      for _, formatter in pairs(formatters) do
        table.insert(clients, formatter.name)
      end
    end

    if #clients == 0 then
      return ""
    else
      return " %#St_gitIcons# " .. (vim.o.columns > 100 and table.concat(clients, ", ") or "") .. " "
    end
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
