---@type LazySpec
return {
	"harrisoncramer/gitlab.nvim",
	enabled = false,
	build = function()
		require("gitlab.server").build(true)
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			optional = true,
		},
	},
	config = true,
}
