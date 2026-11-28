---@type vim.lsp.Config
return {
	filetypes = {
		"yaml.azure",
	},
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			schemaStore = {
				enable = false,
			},
		},
	},
}
