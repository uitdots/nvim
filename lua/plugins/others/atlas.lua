return {
	"emrearmagan/atlas.nvim",
	cmd = "Atlas",
	---@module 'atlas'
	---@type AtlasConfig
	opts = {
		ui = {
			picker = "snacks",
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"esmuellert/codediff.nvim",
	},
}
