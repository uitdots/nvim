---@module 'overseer'
---@type overseer.TemplateDefinition
return {
	name = "Go Default",
	desc = "Run go file directly",
	builder = function()
		local file = vim.fn.expand("%:p")

		---@type overseer.TaskDefinition
		return {
			cmd = { "go", "run", file },
			components = {
				"default",
				"output",
			},
		}
	end,
	condition = {
		filetype = { "go" },
	},
	priority = -1,
}
