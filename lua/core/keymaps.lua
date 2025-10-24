local map = vim.keymap.set
local o = vim.o
local api = vim.api
local t = vim.t
local cmd = vim.cmd
local index_of = require("utils.helpers").index_of

map("n", "<C-s>", "<cmd>w<cr>", { desc = "General | Write", silent = true })
map("n", "<leader><Esc>", "<cmd>noh<cr>", { desc = "General | No Highlights", silent = true })
map("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All to S-Clip", silent = true })
map("v", "<leader>y", '"+y', { desc = "General | Yank System" })

-- Options
map("n", "<leader>om", function()
  o.mouse = o.mouse == "a" and "" or "a"
  vim.notify(vim.o.mouse == "a" and "Enabled" or "Disabled", vim.log.levels.INFO, { title = "Mouse", id = "neovim_mouse", icon = "󰇀" })
end, { desc = "Options | Toggle Mouse", silent = true })

map("n", "<leader>ol", function()
  o.number = not o.number
  vim.notify(vim.o.number and "Enabled" or "Disabled", vim.log.levels.INFO, { title = "Number", id = "neovim_number", icon = "" })
end, { desc = "Options | Toggle Line Number", silent = true })

map("n", "<leader>or", function()
  o.relativenumber = not o.relativenumber
  vim.notify(vim.o.relativenumber and "Enabled" or "Disabled", vim.log.levels.INFO, { title = "Relative Number", id = "neovim_relative_number", icon = "󰉻" })
end, { desc = "Options | Toggle Relative Number", silent = true })

map("n", "<leader>os", function()
  o.laststatus = o.laststatus == 0 and 3 or 0
  vim.notify(o.laststatus == 0 and "Hide" or "Show", vim.log.levels.INFO, { title = "Statusline", id = "neovim_laststatus", icon = "" })
end, { desc = "Options | Toggle Statusline", silent = true })

map("n", "<leader>oi", function()
  local options = {
    "",
    "vietnamese-telex_utf-8",
  }
  local index = index_of(options, function(keymap)
    return keymap == o.keymap
  end)
  o.keymap = options[index % #options + 1]
  vim.notify("Changed to: " .. o.keymap, vim.log.levels.INFO, { title = "Method input", id = "input_method", icon = "" })
end, { desc = "Options | Toggle Input Method", silent = true })

map("n", "<leader>o<C-t>", function()
  o.showtabline = o.showtabline == 1 and 2 or 1
  vim.notify(o.showtabline == 0 and "Hide" or "Show", vim.log.levels.INFO, { title = "Tabline", id = "neovim_tabline", icon = "󰖯" })
end, { desc = "Options | Toggle Tabline", silent = true })

map("n", "<leader>oS", function()
  vim.wo.spell = not vim.wo.spell
  vim.notify(vim.wo.spell and "Enabled" or "Disabled", vim.log.levels.INFO, { title = "Spell", id = "neovim_spell", icon = "" })
end, { desc = "Options | Toggle Spell Check", silent = true })

map("n", "<leader>oc", function()
  vim.wo.conceallevel = vim.wo.conceallevel == 0 and 3 or 0
  vim.notify(vim.wo.conceallevel == 0 and "Off" or "On", vim.log.levels.INFO, { title = "Conceal", id = "neovim_conceallevel", icon = "" })
end, { desc = "Options | Toggle Conceal", silent = true })

map("n", "<leader>ow", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.notify(vim.wo.wrap and "Enabled" or "Disabled", vim.log.levels.INFO, { title = "Wrap", id = "neovim_wrap", icon = "󰖶" })
end, { desc = "Options | Toggle Wrap", silent = true })

-- Navigation
map({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })
map({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })
map({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })
map({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

for i = 1, 9, 1 do
  map("n", string.format("<M-%s>", i), function()
    api.nvim_set_current_buf(t.bufs[i])
  end, { desc = string.format("General | Go to Buff %s", i), silent = true })
end
map("n", "<M-0>", function()
  api.nvim_set_current_buf(t.bufs[10])
end, { desc = "General | Go to Buff 10", silent = true })

-- map("n", "<leader>w", function()
--   if vim.bo.buftype == "terminal" then
--     cmd("Bdelete!")
--     cmd("silent! close")
--   elseif #api.nvim_list_wins() > 1 then
--     cmd("silent! close")
--   end
-- end, { desc = "General | Safe Close Window", silent = true })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "General | Add size at the left", silent = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "General | Add size at the right", silent = true })

-- map("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })
-- map("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })
-- map("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })
-- map("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- map("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })
map("v", "<", "<gv", { desc = "General | Indent backward", silent = true })
map("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal | Escape Terminal Mode", silent = true })

-- Plugins
map("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Plugin | Clean", silent = false })
map("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Plugin | Check", silent = true })
map("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Plugin | Debug", silent = true })
map("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Plugin | Install", silent = true })
map("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Plugin | Sync", silent = true })
map("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Plugin | Log", silent = true })
map("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Plugin | Home", silent = true })
map("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Plugin | Help", silent = true })
map("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Plugin | Profile", silent = true })
map("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Plugin | Update", silent = true })

-- Neovim
map("n", "<leader>nI", function()
  cmd("Inspect")
end, { desc = "Neovim | Inspect", silent = true })

map("n", "<leader>nM", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

map("n", "<leader>nm", function()
  vim.bo.modifiable = not vim.bo.modifiable
  vim.notify(vim.bo.modifiable and "True" or "False", vim.log.levels.INFO, { title = "Current file modifiability", id = "modifiability", icon = "" })
end, { desc = "Neovim | Toggle Modifiable", silent = true })

map("n", "<leader>nH", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

map("n", "<leader>nv", function()
  vim.notify(tostring(vim.version()), vim.log.levels.INFO, { title = "Neovim Version", id = "neovim_verion", icon = "" })
end, { desc = "Neovim | Version", silent = true })

map("n", "<leader>np", function()
  vim.notify(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":."), vim.log.levels.INFO, { title = "Relative File Path", id = "relative_file_path", icon = "" })
end, { desc = "Neovim | Relative File Path", silent = true })

map("n", "<leader>nP", function()
  vim.notify(vim.api.nvim_buf_get_name(0), vim.log.levels.INFO, { title = "Absolute File Path", id = "absolute_file_path", icon = "" })
end, { desc = "Neovim | Absolute File Path", silent = true })

map("n", "<leader>nf", function()
  vim.notify(vim.bo.filetype, vim.log.levels.INFO, { title = "Current Filetype", id = "current_ft" })
end, { desc = "Neovim | Current Filetype", silent = true })

map("n", "<leader>nr", require("configs.runner.init").run, { desc = "Neovim | Runner", silent = true })

-- Treesitter
map("n", "<leader>ti", function()
  vim.treesitter.inspect_tree()
end, { desc = "Treesitter | Inspect", silent = true })

-- Command
map("c", "<M-p>", "<C-R>=expand('%:p')<CR>", { desc = "Command | Insert Current Buffer Path", silent = true })

-- UTILS
-- map("v", "<leader>us", ":sort<cr>gv<esc>", { desc = "Utils | Sort", silent = true })
-- map("v", "<leader>uu", ":sort u<cr>gv<esc>", { desc = "Utils | Sort Unique", silent = true })

map("n", "<leader>ux", function()
  vim.ui.input({ prompt = "Enter filename", default = "%" }, function(filename)
    if filename == nil then
      return
    end
    cmd("!chmod +x " .. filename)
  end)
end, { desc = "Utils | Add Executable Permission", silent = true })
