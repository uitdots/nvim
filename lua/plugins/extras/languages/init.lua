local is_windows = require("utils.os").is_windows

---@type LazySpec
return {
  {
    import = "plugins.extras.languages.ansible",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.assembly",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.c",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.config",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.cs",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.css",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.docker",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.env",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.dart",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.git",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.github",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.gitlab",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.go",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.groovy",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.hcl",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.helm",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.html",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.http",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.java",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.jenkins",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.json",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.just",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.kbd",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.kotlin",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.kubernetes",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.latex",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.lua",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.make",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.markdown",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.nginx",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.powershell",
    enabled = is_windows,
  },
  {
    import = "plugins.extras.languages.python",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.react",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.rust",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.shell",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.sql",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.tailwind",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.terraform",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.toml",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.typescript",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.vim",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.xml",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.yaml",
    enabled = true,
  },
}
