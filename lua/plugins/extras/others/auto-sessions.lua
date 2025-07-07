local auto_session = false

---@type LazySpec
return {
  "rmagatti/auto-session",
  lazy = not auto_session,
  cmds = not auto_session and {
    "Autosession",
    "SessionDelete",
    "SessionPurgeOrphaned",
    "SessionRestore",
    "SessionSave",
    "SessionSearch",
    "SessionToggleAutoSave",
  } or nil,
  keys = {
    {
      "<leader>sf",
      "<cmd>SessionSearch<CR>",
      desc = "Session | Find",
    },
    {
      "<leader>ss",
      "<cmd>SessionSave<CR>",
      desc = "Session | Save",
    },
    {
      "<leader>sr",
      "<cmd>SessionRestore<CR>",
      desc = "Session | Restore",
    },
    {
      "<leader>sd",
      "<cmd>SessionDelete<CR>",
      desc = "Session | Delete",
    },
    {
      "<leader>sp",
      "<cmd>SessionPurgeOrphaned<CR>",
      desc = "Session | Purge Orphaned",
    },
    {
      "<leader>st",
      "<cmd>SessionToggleAutoSave<CR>",
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
