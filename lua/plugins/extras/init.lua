local ide_mode = require("utils.os").ide_mode
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  {
    import = "plugins.extras.ai",
    enabled = true,
  },
  {
    import = "plugins.extras.blink",
    enabled = true,
  },
  {
    import = "plugins.extras.chezmoi",
    enabled = is_executable("chezmoi"),
  },
  {
    import = "plugins.extras.coding",
    enabled = true,
    cond = ide_mode,
  },
  {
    import = "plugins.extras.dap",
    cond = ide_mode,
    enabled = true,
  },
  {
    import = "plugins.extras.database",
    cond = ide_mode,
    enabled = true,
  },
  {
    import = "plugins.extras.git",
    enabled = true,
  },
  {
    import = "plugins.extras.languages.init",
    enabled = true,
  },
  {
    import = "plugins.extras.lsp",
    cond = ide_mode,
    enabled = true,
  },
  {
    import = "plugins.extras.mason",
    cond = ide_mode,
    enabled = true,
  },
  {
    import = "plugins.extras.motion",
    enabled = true,
  },
  {
    import = "plugins.extras.others",
    enabled = true,
  },
  {
    import = "plugins.extras.silly",
    enabled = true,
  },
  {
    import = "plugins.extras.telescope",
    enabled = true,
  },
  {
    import = "plugins.extras.test",
    cond = ide_mode,
    enabled = true,
  },
  {
    import = "plugins.extras.ui",
    enabled = true,
  },
}
