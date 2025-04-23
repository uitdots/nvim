---@type NvPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "b0o/nvim-tree-preview.lua",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<cr>",
      desc = "General | NvimTree",
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
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")
      local preview = require("nvim-tree-preview")

      local function opts(desc)
        return { desc = "NvimTree | " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
      -- NOTE: Config for "b0o/nvim-tree-preview.lua"
      vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
      vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
      vim.keymap.set("n", "<Tab>", function()
        local ok, node = pcall(api.tree.get_node_under_cursor)
        if ok and node then
          if node.type == "directory" then
            api.node.open.edit()
          else
            preview.node(node, { toggle_focus = true })
          end
        end
      end, opts("Preview"))
    end,
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
      enable = true,
      update_cwd = true,
      ignore_list = {},
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
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
        },
      },
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
  },
}
