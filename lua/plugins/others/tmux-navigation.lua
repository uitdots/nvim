---@type LazySpec
return {
	"alexghergh/nvim-tmux-navigation",
	cond = vim.env.TMUX ~= nil,
	event = "VeryLazy",
	opts = {
		keybindings = {
			left = "<C-h>",
			down = "<C-j>",
			up = "<C-k>",
			right = "<C-l>",
			last_active = "<C-\\>",
			next = "<C-Space>",
		},
	},
}
