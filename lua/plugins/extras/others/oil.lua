---@type LazySpec
return {
  "stevearc/oil.nvim",
  keys = {
    {
      "<leader>fo",
      "<CMD>Oil --float<CR>",
      desc = "File | Toggle Oil",
      silent = true,
    },
  },
  cmd = "Oil",
  opts = {
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = false,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    -- Configuration for the floating window in oil.open_float
    float = {
      -- Padding around the floating window
      padding = 2,
      max_height = math.ceil(vim.o.lines * 0.8 - 4),
      max_width = math.ceil(vim.o.columns * 0.4),
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
    use_default_keymaps = true,
  },
}
