local preferences_options = require("preferences").options

---@type LazySpec
return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<cr>",
      desc = "General | Toggle NvimTree",
      silent = true,
    },
    {
      "<leader><Tab>",
      "<cmd>NvimTreeFindFile<cr>",
      desc = "General | NvimTree Find Current",
      silent = true,
    },
  },
  cmd = {
    "NvimTreeOpen",
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
  },
  -- TODO: This opt is to many custom. Use default if possible?
  opts = {
    diagnostics = {
      enable = true,
    },
    filters = {
      enable = true,
      dotfiles = false,
      git_ignored = false,
      exclude = {
        ".github",
        ".*test.*",
      },
      custom = {
        ".*.ruff_cache$",
        ".*.spec$",
        ".*LICENSE.*",
        ".*__pycache__$",
        ".DS_Store",
        "^\\.git$",
        "thumbs.db",
        ".*.egg-info", -- python's stuff
      },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = false,
      update_cwd = false,
    },
    git = {
      enable = true,
      ignore = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      timeout = 5000,
    },
    view = {
      cursorline = true,
      number = true,
      relativenumber = true,
      width = 40,
    },
    renderer = {
      highlight_git = false,
      root_folder_label = ":~:s?$?",
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
    actions = {
      file_popup = {
        open_win_config = {
          border = preferences_options.ui.border_enabled and "rounded" or "none",
        },
      },
    },
  },
  dependencies = "nvim-tree/nvim-web-devicons",
}
