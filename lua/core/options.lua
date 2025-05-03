local opt = vim.opt
local o = vim.o
local g = vim.g
local is_executable = require("utils.executable").is_executable
local uitvim_options = require("uitvim").options

g.mapleader = " "
g.maplocalleader = "\\"

o.laststatus = 3 -- global statusline
o.backup = false -- creates a backup file
o.breakindent = true
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
-- o.fileformats = "unix,dos" -- prefer file formats to read by neovim
-- o.fixendofline = false -- set to "true" to auto add endline char at the end of file
o.hidden = true -- required to keep multiple buffers and open multiple buffers
o.ignorecase = true -- ignore case in search patterns
o.linebreak = true -- for wrap to not break word
o.mouse = "a" -- allow the mouse to be used in neovim
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.pumheight = 8 -- pop up menu height
o.pumblend = 0 -- transparency of pop-up menu
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.smartcase = true -- smart case
o.smartindent = false -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = true -- creates a swapfile
o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 100 -- faster completion (4000ms default)
o.winblend = 0 -- make transparency for floating window (cmp,...)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.tabstop = 2 -- insert 2 spaces for a tab
o.cursorline = true -- highlight the current line
o.cursorlineopt = "number" -- highlight number only
o.number = true -- set numbered lines
o.relativenumber = true -- set relative numbered lines
o.numberwidth = 5 -- set number column width to 4 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = true -- display lines as one long line
o.scrolloff = 4 -- minimal number of columns to scroll horizontally.
o.sidescrolloff = 8 -- minimal number of screen columns
o.lazyredraw = false -- Won't be redrawn while executing macros, register and other commands.
o.termguicolors = true -- Enables 24-bit RGB color in the TUI
opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " } -- make EndOfBuffer invisible
o.ruler = false -- show the line and column number of the cursor position``
o.cmdheight = 0 -- height of the command line
o.helpheight = 10 -- height of the help window
o.shortmess = "AcqFI"
o.exrc = true -- Load .nvimrc, .nvim.lua, .exrc
o.winborder = uitvim_options.border_enabled and "rounded" or "none"

-- Uncomment these options to enable pwsh for Windows
-- o.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
-- o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- o.shellquote = ""
-- o.shellxquote = ""

opt.whichwrap:append("<>[]hl")
-- opt.iskeyword:append "-"

-- Replace builtin grep with ripgrep
if is_executable("rg") then
  local rgignore = vim.env.HOME .. "/.config/ripgrep/.rgignore"
  o.grepprg = "rg --vimgrep --no-heading --smart-case --ignore-file "
    .. (vim.fn.filereadable(rgignore) == 1 and rgignore or vim.fn.stdpath("config") .. "/.config/ripgrep/ignore")
end
