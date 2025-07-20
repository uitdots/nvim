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
  opts = {
    filters = {
      dotfiles = true,
      custom = {
        ".*.ruff_cache$",
        ".*.spec$",
        ".*LICENSE.*",
        ".*__pycache__$",
        ".DS_Store",
        "thumbs.db",
        ".*.egg-info", -- python's stuff
      },
    },
    sync_root_with_cwd = true,
    view = {
      cursorline = true,
      number = true,
      relativenumber = true,
      width = 40,
    },
    renderer = {
      highlight_git = false,
      root_folder_label = ":~:s?$?",
    },
    actions = {
      file_popup = {
        open_win_config = {
          border = vim.o.winborder,
        },
      },
    },
  },
  dependencies = "nvim-tree/nvim-web-devicons",
}
