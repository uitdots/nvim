local uitvim_options = require("uitvim").options
local nvdash_config = require("configs.ui.nvdash")

---@type ChadrcConfig
local M = {}

M.ui = {
  telescope = {
    style = uitvim_options.border_enabled and "bordered" or "borderless",
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
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "macro_recording",
      "command",
      "diagnostics",
      "flutter",
      "python_venv",
      "auto_format",
      "lsps",
      "linters",
      "formatters",
      "separator",
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
  header = nvdash_config.headers.uitvim,
  buttons = {
    { txt = "─", no_gap = true, rep = true },
    { txt = "", no_gap = true, rep = true },
    {
      txt = "  Find File",
      hl = "NvDashButton",
      keys = "<Spc><Spc>",
      cmd = "lua Snacks.picker.files({ hidden = true })",
    },
    { txt = "  Recent Files", hl = "NvDashButton", keys = "<Spc>fr", cmd = "lua Snacks.picker.recent()" },
    { txt = "󰈭  Find Word", hl = "NvDashButton", keys = "<Spc>fw", cmd = "lua Snacks.picker.grep()" },
    {
      txt = "󱥚  Themes",
      hl = "NvDashButton",
      keys = "<Spc>ft",
      cmd = 'lua require("telescope").extensions.themes.themes()',
    },
    { txt = "  Cheat Sheet", hl = "NvDashButton", keys = "<Spc>nc", cmd = "NvCheatsheet" },
    { txt = "─", no_gap = true, rep = true },
    {
      txt = function()
        local ok, stats = pcall(function()
          local lazy_stats = require("lazy").stats()
          return {
            loaded = lazy_stats.loaded,
            count = lazy_stats.count,
            milliseconds = math.floor(lazy_stats.startuptime) .. " ms",
          }
        end)
        if ok then
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. stats.milliseconds
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
  pkgs = {
    -- Lua
    "lua-language-server",
    "vim-language-server",
    "stylua",

    -- Web Development
    "css-lsp",
    "emmet-language-server",
    "eslint-lsp",
    "html-lsp",
    "js-debug-adapter",
    "prettier",
    "tailwindcss-language-server",
    "typescript-language-server",

    -- C/C++
    "clang-format",
    "clangd",
    -- "codelldb",

    -- CMake
    -- "cmake-language-server",
    -- "neocmakelsp",

    -- Java
    -- "jdtls",

    -- Json
    "json-lsp",

    -- Yaml
    "yaml-language-server",

    -- Toml
    "taplo",

    -- Github Action
    "actionlint",

    -- Python
    "basedpyright",
    "debugpy",
    "ruff",
    -- "pyright",

    -- C#
    -- "csharpier",
    -- "omnisharp",
    -- "omnisharp-mono",

    -- Go
    -- "gopls",

    -- Markdown
    "doctoc",
    "markdownlint",
    -- "marksman",

    -- Shell
    "bash-language-server",
    "beautysh",
    "shellcheck",
    "shfmt",

    -- Docker
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- Database
    "postgrestools",
    "sqlfluff",
    "sqls",
    -- "sql-formatter",

    -- Others
    "codespell",
  },
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
    "dap",
    "defaults",
    "devicons",
    "diffview",
    "flash",
    "git",
    "git-conflict",
    "grug_far",
    "lsp",
    "markview",
    "mason",
    "navic",
    "nvcheatsheet",
    "nvimtree",
    "nvshades",
    "rainbowdelimiters",
    "semantic_tokens",
    "statusline",
    "syntax",
    "telescope",
    "tiny-inline-diagnostic",
    "todo",
    "treesitter",
    "trouble",
    "whichkey",
  },
}

M.base46.hl_override = {
  Search = { bg = "base0D" },

  Visual = M.base46.transparency and vim.list_contains({ "catppuccin" }, M.base46.theme) and { bg = "one_bg3" } or {},

  FlashLabel = { bg = "red", fg = "black" },
}

M.base46.hl_add = {
  FloatBorder = { fg = "grey_fg" },
  NormalFloat = { fg = "NONE", bg = "NONE", link = "Normal" },

  -- Dadbod UI
  NotificationInfo = { fg = "green", bg = "one_bg" },
  NotificationWarning = { fg = "yellow", bg = "one_bg" },
  NotificationError = { fg = "red", bg = "one_bg" },

  -- For statusline
  St_Percent_icon = { fg = "black", bg = "blue" },
  St_Percent_sep = { fg = "blue", bg = "lightbg" },
  St_Percent_text = { link = "St_percent_sep" },

  -- visual-whitespace
  VisualNonText = { link = "Comment" },

  -- Snacks
  SnacksIndent = { link = "IblChar" },
  SnacksIndentScope = { link = "IblScopeChar" },

  SnacksNormal = { link = "TelescopeNormal" },

  SnacksPickerDir = { fg = "light_grey" },
  SnacksPickerListTitle = { link = "TelescopeResultsTitle" },
  SnacksPickerMatch = { link = "TelescopeMatching" },
  SnacksPickerPreviewTitle = { link = "TelescopePreviewTitle" },
  SnacksPickerPrompt = { link = "TelescopePromptPrefix" },
  SnacksPickerSelect = { link = "TelescopeSelection" },
  SnacksPickerTitle = { link = "TelescopePromptTitle" },
  SnacksPickerToggle = { fg = "black", bg = "red" },
}

return M
