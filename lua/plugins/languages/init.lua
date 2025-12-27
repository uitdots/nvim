local is_windows = require("utils.os").is_windows

---@type LazySpec
return {
  {
    import = "plugins.languages.ansible",
    enabled = false,
  },
  {
    import = "plugins.languages.assembly",
    enabled = false,
  },
  {
    import = "plugins.languages.c",
    enabled = false,
  },
  {
    import = "plugins.languages.config",
  },
  {
    import = "plugins.languages.cs",
    enabled = false,
  },
  {
    import = "plugins.languages.css",
  },
  {
    import = "plugins.languages.d2",
  },
  {
    import = "plugins.languages.docker",
  },
  {
    import = "plugins.languages.env",
  },
  {
    import = "plugins.languages.dart",
    enabled = false,
  },
  {
    import = "plugins.languages.git",
  },
  {
    import = "plugins.languages.github",
  },
  {
    import = "plugins.languages.gitlab",
    enabled = false,
  },
  {
    import = "plugins.languages.go",
  },
  {
    import = "plugins.languages.grafana",
  },
  {
    import = "plugins.languages.groovy",
    enabled = false,
  },
  {
    import = "plugins.languages.hcl",
  },
  {
    import = "plugins.languages.helm",
    enabled = false,
  },
  {
    import = "plugins.languages.html",
  },
  {
    import = "plugins.languages.http",
  },
  {
    import = "plugins.languages.java",
  },
  {
    import = "plugins.languages.jenkins",
    enabled = false,
  },
  {
    import = "plugins.languages.json",
  },
  {
    import = "plugins.languages.just",
  },
  {
    import = "plugins.languages.kbd",
  },
  {
    import = "plugins.languages.kotlin",
  },
  {
    import = "plugins.languages.kubernetes",
  },
  {
    import = "plugins.languages.latex",
  },
  {
    import = "plugins.languages.lua",
  },
  {
    import = "plugins.languages.make",
  },
  {
    import = "plugins.languages.markdown",
  },
  {
    import = "plugins.languages.nginx",
    enabled = false,
  },
  {
    import = "plugins.languages.nix",
    enabled = false,
  },
  {
    import = "plugins.languages.openapi",
  },
  {
    import = "plugins.languages.plantuml",
  },
  {
    import = "plugins.languages.powershell",
    enabled = is_windows,
  },
  {
    import = "plugins.languages.proto",
  },
  {
    import = "plugins.languages.python",
  },
  {
    import = "plugins.languages.react",
  },
  {
    import = "plugins.languages.redis",
  },
  {
    import = "plugins.languages.rust",
    enabled = false,
  },
  {
    import = "plugins.languages.shell",
  },
  {
    import = "plugins.languages.sql",
  },
  {
    import = "plugins.languages.tailwind",
    enabled = false,
  },
  {
    import = "plugins.languages.terraform",
  },
  {
    import = "plugins.languages.toml",
  },
  {
    import = "plugins.languages.typescript",
  },
  {
    import = "plugins.languages.vim",
  },
  {
    import = "plugins.languages.xml",
  },
  {
    import = "plugins.languages.yaml",
  },
}
