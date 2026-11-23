vim.filetype.add({
	pattern = {
		[".*/%.azure-pipelines[%w/]+.*%.ya?ml"] = "yaml.azure",
	},
})

---@type LazySpec
return {}
