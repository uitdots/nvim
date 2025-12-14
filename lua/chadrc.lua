local nvdash_config = require("configs.ui.nvdash")

---@module 'ui'
---@type ChadrcConfig
local M = {}

M.colorify = {
  enabled = true,
  mode = "bg",
}

M.ui = {
  telescope = {
    style = "bordered",
  },
  cmp = {
    lspkind_text = true,
    style = "default",
    format_colors = {
      tailwind = true,
    },
  },
  statusline = {
    theme = "default",
    separator_style = "default",
    ---NOTE: The more modules, the more it run every time neovim rerender. use only you need
    order = {
      "mode",
      "file",
      "git",
      "%=",
      -- "lsp_msg", -- Yeah I use snacks already?
      -- "%=",
      "diagnostics",
      "command",
      -- "flutter",
      "lsps",
      "linters",
      "formatters",
      "separator",
      -- "python_venv",
      "codecompanion",
      "macro_recording",
      "auto_format",
      "end_of_line",
      "cwd",
      "cursor",
      "line_percentage",
    },
    modules = require("configs.ui.statusline"),
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    order = {
      -- "treeOffset",
      "buffers",
      "tabs",
      "btns",
    },
    modules = require("configs.ui.tabufline"),
  },
}

M.nvdash = {
  load_on_startup = true,
  header = nvdash_config.headers.uv,
  buttons = {
    { txt = "─", no_gap = false, rep = true },
    {
      txt = "  Find File",
      hl = "NvDashButton",
      keys = "<Spc><Spc>",
      cmd = "lua Snacks.picker.files({ hidden = true })",
    },
    {
      txt = "  Recent Files",
      hl = "NvDashButton",
      keys = "<Spc>fr",
      cmd = "lua Snacks.picker.recent()",
    },
    {
      txt = "󰈭  Find Word",
      hl = "NvDashButton",
      keys = "<Spc>fw",
      cmd = "lua Snacks.picker.grep()",
    },
    {
      txt = "󱥚  Themes",
      hl = "NvDashButton",
      keys = "<Spc>ft",
      cmd = 'lua require("telescope").extensions.themes.themes()',
    },
    {
      txt = "  Cheat Sheet",
      hl = "NvDashButton",
      keys = "<Spc>nc",
      cmd = "NvCheatsheet",
    },
    { txt = "─", no_gap = true, rep = true },
    {
      txt = function()
        local ok, stats = pcall(function()
          local lazy_stats = require("lazy").stats()
          return {
            loaded = lazy_stats.loaded,
            count = lazy_stats.count,
            milliseconds = math.floor(lazy_stats.startuptime),
          }
        end)
        if ok then
          return string.format("  Loaded %d/%d plugins in %d ms", stats.loaded, stats.count, stats.milliseconds)
        else
          return "󰇸 Cannot load lazy's status"
        end
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
  },
}

M.mason = {
  cmd = false,
}

M.lsp = {
  signature = false,
}

M.cheatsheet = {
  theme = "grid",
}

M.base46 = {
  theme = "catppuccin",
  transparency = false,
  theme_toggle = { "catppuccin", "one_light" },
  integrations = {
    "avante",
    "blankline",
    "blink",
    "codeactionmenu",
    "dap",
    "defaults",
    "devicons",
    "diffview",
    "flash",
    "git",
    "grug_far",
    "lsp",
    "markview",
    "mason",
    "nvcheatsheet",
    "nvimtree",
    "nvshades",
    "rainbowdelimiters",
    "semantic_tokens",
    "statusline",
    "syntax",
    "telescope",
    "todo",
    "treesitter",
    "trouble",
    "whichkey",
  },
}

M.base46.hl_override = {
  FlashLabel = { bg = "grey", fg = "white" },
  FlashMatch = { bg = "blue", fg = "black" },
  FlashCurrent = { bg = "yellow", fg = "black" },
}

if M.base46.theme == "catppuccin" then
  M.base46.hl_override.Search = { fg = "NONE", bg = "one_bg2" }
end

M.base46.hl_add = {
  FloatBorder = { fg = "grey_fg" },
  NormalFloat = { fg = "NONE", bg = "NONE", link = "Normal" },

  ---Dadbod UI
  NotificationInfo = { fg = "green", bg = "one_bg" },
  NotificationWarning = { fg = "yellow", bg = "one_bg" },
  NotificationError = { fg = "red", bg = "one_bg" },

  ---For statusline
  St_Percent_icon = { fg = "black", bg = "blue" },
  St_Percent_sep = { fg = "blue", bg = "lightbg" },
  St_Percent_text = { link = "St_percent_sep" },

  ---Snacks
  SnacksIndent = { link = "IblChar" },
  -- SnacksIndentScope = { link = "IblScopeChar" },
  SnacksIndentScope = { fg = "light_grey" }, -- It's too dark :(
  SnacksNormal = { link = "TelescopeNormal" },
  SnacksPickerDir = { fg = "light_grey" },
  SnacksPickerListTitle = { link = "TelescopeResultsTitle" },
  SnacksPickerMatch = { link = "TelescopeMatching" },
  SnacksPickerPreviewTitle = { link = "TelescopePreviewTitle" },
  SnacksPickerPrompt = { link = "TelescopePromptPrefix" },
  SnacksPickerSelect = { link = "TelescopeSelection" },
  SnacksPickerTitle = { link = "TelescopePromptTitle" },
  SnacksPickerToggle = { fg = "black", bg = "red" },

  ---Noice
  NoiceVirtualText = { fg = "lavender" },

  ---nvim-treesitter-context
  TreesitterContext = { bg = "black2" },

  ---Mini
  MiniIndentscopeSymbol = { link = "IblChar" },

  ---Glance
  GlanceBorderTop = { fg = "line", bg = "none" },
  GlanceBorderBottom = { fg = "line", bg = "none" },
  GlancePreviewBorderBottom = { fg = "line", bg = "none" },
  GlancePreviewEndOfBuffer = { fg = "black2", bg = "black2" },
  GlanceListEndOfBuffer = { fg = "black2", bg = "black2" },
  GlanceWinBarFilepath = { fg = "light_grey", bg = "black2" },
  GlanceWinBarFilename = { fg = "base05", bg = "black2" },
  GlanceWinBarTitle = { fg = "green", bg = "black2" },
  GlanceListCursorLine = { bg = "grey" },
  GlanceListNormal = { bg = "black2", fg = "base05" },
  GlanceListFilepath = { fg = "light_grey" },
  GlancePreviewNormal = { bg = "black" },

  ---Neotest
  NeotestPassed = { fg = "green" },
  NeotestFailed = { fg = "red" },
  NeotestTarget = { fg = "pink" },
  NeotestRunning = { fg = "yellow" },
  NeotestSkipped = { fg = "cyan" },
  NeotestWatching = { fg = "orange" },
  NeotestNamespace = { fg = "purple" },
  NeotestIndent = { fg = "line" },
  NeotestDir = { link = "Directory" },
  NeotestFile = { fg = "base05" },
  NeotestAdapterName = { fg = "red" },
  NeotestExpandMarker = { fg = "grey" },
  NeotestMarked = { fg = "dark_purple" },
  NeotestWinSelect = { bg = "cyan" },

  --- nvim-corage
  CoverageCovered = { fg = "green", bg = "none" },
  CoverageUncovered = { fg = "red", bg = "none" },
}

return M
