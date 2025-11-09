local auto_session = false

---@type LazySpec
return {
  "rmagatti/auto-session",
  lazy = not auto_session,
  cmds = not auto_session and "Autosession" or nil,
  keys = {
    {
      "<leader>sS",
      "<cmd>AutoSession search<CR>",
      desc = "Session | Search",
    },
    {
      "<leader>ss",
      "<cmd>AutoSession save<CR>",
      desc = "Session | Save",
    },
    {
      "<leader>sr",
      "<cmd>AutoSession restore<CR>",
      desc = "Session | Restore",
    },
    {
      "<leader>sd",
      "<cmd>AutoSession delete<CR>",
      desc = "Session | Delete",
    },
    {
      "<leader>sp",
      "<cmd>AutoSession purgeOrphaned<CR>",
      desc = "Session | Purge Orphaned",
    },
    {
      "<leader>st",
      "<cmd>AutoSession toggle<CR>",
      desc = "Session | Toggle Autosave",
    },
  },
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    enabled = auto_session,
  },
  init = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
}
