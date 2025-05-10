local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local indent = require("uitvim").indent

-- General Settings
local general = augroup("General", { clear = true })

for chars, fts in pairs(indent.space or {}) do
  autocmd("FileType", {
    desc = string.format("Tab to space with %s spaces", chars),
    pattern = fts,
    command = string.format("set tabstop=%s shiftwidth=%s expandtab", chars, chars),
    group = general,
  })
end

for chars, fts in pairs(indent.tab or {}) do
  autocmd("FileType", {
    desc = string.format("Tab to space with %s spaces", chars),
    pattern = fts,
    command = string.format("set tabstop=%s shiftwidth=%s noexpandtab", chars, chars),
    group = general,
  })
end

autocmd("BufReadPost", {
  callback = function()
    local exclude_fts = {
      "gitcommit",
    }
    for _, ft in pairs(exclude_fts) do
      if ft == vim.bo.filetype then
        return
      end
    end
    if fn.line("'\"") > 1 and fn.line("'\"") <= fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
  group = general,
  desc = "Go To The Last Cursor Position",
})

autocmd("TextYankPost", {
  callback = function()
    require("vim.hl").on_yank({ timeout = 200 })
  end,
  group = general,
  desc = "Highlight when yanking",
})

--[[
autocmd("ModeChanged", {
  callback = function()
    if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
      vim.opt.hlsearch = true
    else
      vim.opt.hlsearch = false
    end
  end,
  group = general,
  desc = "Highlighting matched words when searching",
})
]]

autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general,
  desc = "Disable New Line Comment",
})

autocmd("FocusGained", {
  callback = function()
    vim.cmd("checktime")
  end,
  group = general,
  desc = "Update file when there are changes",
})

autocmd("FileType", {
  pattern = {
    "gitcommit",
    "markdown",
    "text",
  },
  callback = function()
    vim.opt_local.spell = true
  end,
  group = general,
  desc = "Enable Spell check in these filetypes",
})

autocmd("FileType", {
  pattern = {
    "log",
    "markdown",
    "grug-far",
  },
  callback = function()
    vim.opt_local.wrap = false
  end,
  group = general,
  desc = "Disable Wrap in these filetypes",
})

autocmd("BufReadPre", {
  desc = "Disable inlay hint file patterns",
  pattern = {
    "*/node_modules/*",
    "*/.venv/*",
  },
  callback = function()
    local inlay_hint = vim.lsp.inlay_hint
    inlay_hint.enable(false, inlay_hint.get({ bufnr = 0 }))
  end,
  group = general,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "Avante",
    "AvanteInput",
    "PlenaryTestPopup",
    "Regexplainer",
    "checkhealth",
    "dbout",
    "gitsigns.blame",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  group = general,
})

autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
  group = general,
})

-- Docs about change vim cursor in terminal: https://neovim.io/doc/user/faq.html#faq

-- autocmd({ "VimEnter", "VimResume" }, {
--   desc = "Set Cursor in Neovim",
--   command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:Cursor/lCursor,sm:block",
--   group = general,
-- })

-- autocmd({ "VimLeave", "VimSuspend" }, {
--   desc = "Restore Cursor when exit Neovim",
--   command = "set guicursor=a:ver25",
--   group = general,
-- })
