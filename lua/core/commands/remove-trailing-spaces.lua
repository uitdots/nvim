local command = vim.api.nvim_create_user_command
local map = vim.keymap.set

command("TrimWhitespace", function(opts)
	-- Save current cursor position and search register
	local save_cursor = vim.fn.getpos(".")
	local old_query = vim.fn.getreg("/")

	-- Run substitution over the selected range (or whole file if no range is passed)
	vim.cmd(string.format("keeppatterns %d,%ds/\\s\\+$//e", opts.line1, opts.line2))

	-- Restore cursor position and search register
	vim.fn.setpos(".", save_cursor)
	vim.fn.setreg("/", old_query)
end, {
	range = "%", -- Defaults to the whole file (%) if no visual selection is active
	desc = "Trim trailing whitespace",
})

map({ "n", "v" }, "<leader>uw", ":TrimWhitespace<CR>", { silent = true, desc = "Trim trailing whitespace" })
