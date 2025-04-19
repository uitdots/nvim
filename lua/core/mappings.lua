local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "General | Escape", silent = true })
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "General | No Search highlights", silent = true })

map("n", "<C-s>", "<cmd>w<cr>", { desc = "General | Write", silent = true })
map("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })

map("n", "<leader>ol", function()
  vim.o.number = not vim.o.number
end, { desc = "Options | Toggle Line Number", silent = true })

map("n", "<leader>or", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Options | Toggle Relative Number", silent = true })

map("n", "<leader>os", function()
  vim.o.laststatus = vim.o.laststatus == 3 and 3 or 0
end, { desc = "Options | Toggle Statusline", silent = true })

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

map({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })
map({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })
map({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })
map({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

map("n", "<leader>w", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd("Bdelete!")
    vim.cmd("silent! close")
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd("silent! close")
  end
end, { desc = "General | Close window", silent = true })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "General | Add size at the left", silent = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "General | Add size at the right", silent = true })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "General | Go to previous buffer", silent = true })

-- Go to next buffer
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "General | Go to next buffer", silent = true })

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "General | Close Buffer", silent = true })

map("n", "<leader>C", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "General | Close Other Buffers", silent = true })

map("n", "<leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "Find | Themes" })

map("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })
map("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })
map("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })
map("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

map("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })
map("v", "<", "<gv", { desc = "General | Indent backward", silent = true })
map("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Lazy
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
vim.keymap.set("n", "<leader>nc", "<cmd>NvCheatsheet<cr>", { desc = "Neovim | Toggle Cheatsheet", silent = true })

vim.keymap.set("n", "<leader>ni", function()
  if vim.version().minor >= 9 then
    vim.cmd("Inspect")
  else
    vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
  end
end, { desc = "Neovim | Inspect", silent = true }) -- only available on neovim >= 0.9

vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

vim.keymap.set("n", "<leader>nv", function()
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

vim.keymap.set("n", "<leader>np", function()
  vim.notify(vim.api.nvim_buf_get_name(0), vim.log.levels.INFO, { title = "Current File Path" })
end, { desc = "Neovim | Get Current File Path", silent = true })

-- UTILS
vim.keymap.set("n", "<leader>ux", function()
  if vim.fn.has("unix") == 0 then
    return vim.notify("This isn't available for non UNIX based OS")
  end
  vim.ui.input({ prompt = "Enter filename", default = "%" }, function(filename)
    if filename == nil then
      return
    end
    vim.cmd("!chmod +x " .. filename)
  end)
end, { desc = "Utils | Add Executable Permission", silent = true })
