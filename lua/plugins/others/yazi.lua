---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	keys = {
		{
			"<leader>f<C-y>",
			"<cmd>Yazi<cr>",
			desc = "Yazi | Current File",
			mode = { "n", "v" },
		},
		{
			"<leader>fY",
			"<cmd>Yazi cwd<cr>",
			desc = "Yazi | Current Dir",
		},
		{
			"<leader>fy",
			"<cmd>Yazi toggle<cr>",
			desc = "Yazi | Toggle",
		},
	},
	---@module 'yazi'
	---@type YaziConfig
	opts = nil,
	config = true,
}
