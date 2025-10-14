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
    enabled = false,
  },
  {
    import = "plugins.extras.languages.config",
  },
  {
    import = "plugins.extras.languages.cs",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.css",
  },
  {
    import = "plugins.extras.languages.d2",
  },
  {
    import = "plugins.extras.languages.docker",
  },
  {
    import = "plugins.extras.languages.env",
  },
  {
    import = "plugins.extras.languages.dart",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.git",
  },
  {
    import = "plugins.extras.languages.github",
  },
  {
    import = "plugins.extras.languages.gitlab",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.go",
  },
  {
    import = "plugins.extras.languages.grafana",
  },
  {
    import = "plugins.extras.languages.groovy",
  },
  {
    import = "plugins.extras.languages.hcl",
  },
  {
    import = "plugins.extras.languages.helm",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.html",
  },
  {
    import = "plugins.extras.languages.http",
  },
  {
    import = "plugins.extras.languages.java",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.jenkins",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.json",
  },
  {
    import = "plugins.extras.languages.just",
  },
  {
    import = "plugins.extras.languages.kbd",
  },
  {
    import = "plugins.extras.languages.kotlin",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.kubernetes",
  },
  {
    import = "plugins.extras.languages.latex",
  },
  {
    import = "plugins.extras.languages.lua",
  },
  {
    import = "plugins.extras.languages.make",
  },
  {
    import = "plugins.extras.languages.markdown",
  },
  {
    import = "plugins.extras.languages.nginx",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.nix",
  },
  {
    import = "plugins.extras.languages.plantuml",
  },
  {
    import = "plugins.extras.languages.powershell",
    enabled = is_windows,
  },
  {
    import = "plugins.extras.languages.python",
  },
  {
    import = "plugins.extras.languages.react",
  },
  {
    import = "plugins.extras.languages.rust",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.shell",
  },
  {
    import = "plugins.extras.languages.sql",
  },
  {
    import = "plugins.extras.languages.tailwind",
    enabled = false,
  },
  {
    import = "plugins.extras.languages.terraform",
  },
  {
    import = "plugins.extras.languages.toml",
  },
  {
    import = "plugins.extras.languages.typescript",
  },
  {
    import = "plugins.extras.languages.vim",
  },
  {
    import = "plugins.extras.languages.xml",
  },
  {
    import = "plugins.extras.languages.yaml",
  },
}
