-- NOTE: run `:options` to try live options

local opt = vim.opt
local o = vim.o
local g = vim.g
local is_executable = require("utils.executable").is_executable
local preferences_options = require("preferences").options
local home = require("utils.os").home

g.mapleader = " "
g.maplocalleader = "\\"

o.backup = false
o.breakindent = true
o.conceallevel = 0
o.fileencoding = "utf-8"
o.fixendofline = false
o.hidden = true -- required to keep multiple buffers and open multiple buffers
o.laststatus = 3

-- Search
o.ignorecase = true
o.smartcase = true

o.confirm = true
o.mouse = "a"

-- UI
o.cmdheight = 0
o.lazyredraw = false
o.pumblend = 0
o.pumheight = 8
o.shortmess = "AcqFI"
o.showmode = false
o.termguicolors = true
o.winblend = 0
o.winborder = "rounded"

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldclose = "",
  foldopen = "",
  foldsep = " ",
  lastline = " ",
}

-- UI while editing
o.cursorline = true
o.cursorlineopt = "number"
o.linebreak = true -- for wrap to not break word
o.number = true
o.relativenumber = true
o.ruler = false
o.scrolloff = 4
o.sidescrolloff = 8
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = preferences_options.wrap.default

-- Editing
o.expandtab = true
o.shiftwidth = 0
o.tabstop = preferences_options.indent.default

-- Indent
o.smartindent = false
o.autoindent = false

-- Split
o.splitbelow = true
o.splitright = true

o.swapfile = true
o.undofile = true

-- Motion
o.timeoutlen = 500
o.updatetime = 100
o.virtualedit = "block"
opt.whichwrap:append("<>[]hl")
-- opt.iskeyword:append("-") -- Ohm what is this

-- Other
o.exrc = true
o.autoread = true
o.spelloptions = "camel"

-- Uncomment these options to enable pwsh for Windows
-- o.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
-- o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- o.shellquote = ""
-- o.shellxquote = ""

-- Replace builtin grep with ripgrep
if is_executable("rg") then
  local rgignore = string.format("%s/.config/ripgrep/.rgignore", home)
  o.grepprg = "rg --vimgrep --no-heading --smart-case --ignore-file " .. (vim.fn.filereadable(rgignore) == 1 and rgignore or vim.fn.stdpath("config") .. "/.config/ripgrep/ignore")
end
