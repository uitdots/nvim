---@type vim.lsp.Config
return {
	---Set by qvalentin/helm-ls.nvim or towolf/vim-helm
	filetypes = {
		"helm",
		"yaml.helm-values",
	},
	settings = {
		yamlls = {
			enabled = true,
			---@module 'lspconfig'
			---@type _.lspconfig.settings.yamlls.Yaml
			config = nil,
		},
	},
}
