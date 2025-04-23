local nvdash_config = require("configs.ui.nvdash")

---@type ChadrcConfig
local M = {}

M.ui = {
  telescope = { style = vim.g.border_enabled and "bordered" or "borderless" },
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
    { txt = "  Recent Files", hl = "NvDashButton", keys = "<Spc>fr", cmd = "Snacks.picker.recent()" },
    { txt = "󰈭  Find Word", hl = "NvDashButton", keys = "<Spc>fw", cmd = "lua Snacks.picker.grep()" },
    { txt = "󱥚  Themes", hl = "NvDashButton", keys = "<Spc>ft", cmd = 'lua require("nvchad.themes").open()' },
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
  cmd = true,
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
  signature = true,
}

M.cheatsheet = {
  theme = "grid",
}

M.base46 = {
  theme = "catppuccin",
  transparency = false,
  theme_toggle = { "catppuccin", "one_light" },
  -- TODO: Check this later to remove
  integrations = {
    "avante",
    "blankline",
    "blink",
    "codeactionmenu",
    "dap",
    "defaults",
    "devicons",
    "grug_far",
    "lsp",
    "markview",
    "mason",
    "notify",
    "nvimtree",
    "nvshades",
    "rainbowdelimiters",
    "statusline",
    "telescope",
    "todo",
    "treesitter",
    "trouble",
    "whichkey",
  },
  hl_override = {
    Search = { bg = "blue" },
    IncSearch = { bg = "blue" },

    -- WARN: Only suitable while using catppuccin with transparent. Consider to remove if use another theme.
    Visual = { bg = "one_bg2" },
    TelescopeSelection = { bg = "one_bg2" },
    TelescopeMatching = { bg = "NONE" },
  },
  hl_add = {
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
  },
}

return M
