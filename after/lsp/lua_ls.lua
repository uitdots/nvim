local lsp_utils = require("utils.lsp")

---@type vim.lsp.Config
return {
	---@module 'lspconfig'
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			hint = {
				enable = lsp_utils.is_inlay_hint_enabled("lua_ls"),
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
