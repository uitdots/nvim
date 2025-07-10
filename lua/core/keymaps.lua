local map = vim.keymap.set
local o = vim.o
local api = vim.api
local t = vim.t
local cmd = vim.cmd

map("n", "<Esc>", "<cmd>noh<cr>", { desc = "General | No Search highlights", silent = true })

map("n", "<C-s>", "<cmd>w<cr>", { desc = "General | Write", silent = true })
map("v", "<M-c>", '"+y', { desc = "General | Copy to System Register", silent = true }) -- TODO: Check this if it work on MacOS
map("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All", silent = true })

-- Options
map("n", "<leader>ol", function()
  o.number = not o.number
end, { desc = "Options | Toggle Line Number", silent = true })

map("n", "<leader>or", function()
  o.relativenumber = not o.relativenumber
end, { desc = "Options | Toggle Relative Number", silent = true })

map("n", "<leader>os", function()
  o.laststatus = o.laststatus == 3 and 0 or 3
end, { desc = "Options | Toggle Statusline", silent = true })

map("n", "<leader>oi", function()
  if o.keymap == "" then
    o.keymap = "vietnamese-telex_utf-8"
    vim.notify("Method input changed to Custom: " .. o.keymap, vim.log.levels.INFO, {
      title = "Options",
    })
  else
    o.keymap = ""
    vim.notify("Method input changed to Default", vim.log.levels.INFO, {
      title = "Options",
    })
  end
end, { desc = "Options | Toggle Input Method", silent = true })

map("n", "<leader>o<C-t>", function()
  local tabline_enabled = { 1, 2 }
  o.showtabline = tabline_enabled[o.showtabline] ~= nil and 0 or 3
end, { desc = "Options | Toggle Tabline", silent = true })

map("n", "<leader>oS", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Options | Toggle Spell Check", silent = true })

map("n", "<leader>ot", function()
  require("base46").toggle_theme()
end, { desc = "Options | Toggle Theme", silent = true })

map("n", "<leader>oT", function()
  require("base46").toggle_transparency()
end, { desc = "Options | Toggle Transparency", silent = true })

map("n", "<leader>ow", function()
  vim.wo.wrap = not vim.wo.wrap
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
map("n", "<M-0", function()
  api.nvim_set_current_buf(t.bufs[10])
end, { desc = "General | Go to Buff 10", silent = true })

map("n", "<leader>w", function()
  if vim.bo.buftype == "terminal" then
    cmd("Bdelete!")
    cmd("silent! close")
  elseif #api.nvim_list_wins() > 1 then
    cmd("silent! close")
  end
end, { desc = "General | Safe Close Window", silent = true })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "General | Add size at the left", silent = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "General | Add size at the right", silent = true })

map("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })
map("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })
map("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })
map("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- map("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })
map("v", "<", "<gv", { desc = "General | Indent backward", silent = true })
map("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal | Escape Terminal Mode", silent = true })
-- Plugins
map("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Lazy | Clean", silent = false })
map("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Lazy | Check", silent = true })
map("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Lazy | Debug", silent = true })
map("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Lazy | Install", silent = true })
map("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy | Sync", silent = true })
map("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Lazy | Log", silent = true })
map("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Lazy | Home", silent = true })
map("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Lazy | Help", silent = true })
map("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Lazy | Profile", silent = true })
map("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Lazy | Update", silent = true })

-- Neovim
map("n", "<leader>nI", function()
  cmd("Inspect")
end, { desc = "Neovim | Inspect", silent = true })

map("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

map("n", "<leader>nH", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

map("n", "<leader>nv", function()
  return vim.notify(tostring(vim.version()), vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

map("n", "<leader>np", function()
  vim.notify(vim.api.nvim_buf_get_name(0), vim.log.levels.INFO, { title = "Current File Path" })
end, { desc = "Neovim | Get Current File Path", silent = true })

map("n", "<leader>nf", function()
  vim.notify(vim.bo.filetype, vim.log.levels.INFO, { title = "Current Filetype" })
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
