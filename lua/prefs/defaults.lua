---@type Prefs
local M = {
	languages = {
		-- "ansible",
		-- "assembly",
		-- "c",
		"config",
		-- "cs",
		-- "css",
		-- "d2",
		-- "dart",
		-- "docker",
		"env",
		"git",
		"github",
		-- "gitlab",
		-- "go",
		-- "grafana",
		-- "graphql",
		-- "groovy",
		-- "hcl",
		-- "helm",
		-- "html",
		-- "http",
		-- "java",
		-- "jenkins",
		-- "jinja",
		"json",
		-- "just",
		-- "kbd",
		-- "kotlin",
		-- "kubernetes",
		-- "latex",
		"lua",
		-- "make",
		"markdown",
		-- "nginx",
		-- "nix",
		-- "openapi",
		-- "plantuml",
		-- "powershell",
		-- "proto",
		"python",
		-- "react",
		-- "redis",
		-- "rust",
		-- "shell",
		-- "sql",
		-- "tailwind",
		-- "terraform",
		"toml",
		"typescript",
		-- "typst",
		"utils",
		"vim",
		-- "xml",
		"yaml",
	},

	lsp = {
		force = {
			-- "sonarlint", -- NOTE: nvim-lspconfig doesn't support it yet
			"nxls",
		},
		exclude = {
			"dartls",
			"rust_analyzer",
			"sqls",
			"stylua",
			"swaggo_ls",
			"harper_ls",
		},
	},

	options = {
		indent = {
			default = 2,
			space = {
				[4] = {
					"bzl",
					"c",
					"cpp",
					"cs",
					"groovy",
					"hyprland",
					"java",
					"jenkins",
					"just",
					"kotlin",
					"mmd",
					"python",
				},
			},
			tab = {
				[2] = {
					"alloy",
					"tex",
					"lua",
				},
				[4] = {
					"make",
				},
				[8] = {
					"go",
					"gomod",
					"gosum",
					"gowork",
				},
			},
		},

		wrap = {
			default = false,
			revert = {
				-- "grug-far",
				-- "lazy",
				-- "log",
				-- "markdown",
				-- "mason",
				-- "neotest-summary",
			},
		},

		inlay_hint = {
			server_default = true,
			servers = true,
			client = false,
		},

		others = {
			auto_format_enabled = true,
			ai_suggestion_enabled = true,
		},
	},
}

return M
