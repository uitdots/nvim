local ide_mode = require("utils.os").ide_mode
local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  {
    import = "plugins.ai",
    cond = ide_mode,
  },
  {
    import = "plugins.blink",
  },
  {
    import = "plugins.chezmoi",
    enabled = is_executable("chezmoi"),
  },
  {
    import = "plugins.coding",
    cond = ide_mode,
  },
  {
    import = "plugins.dap",
    cond = ide_mode,
  },
  {
    import = "plugins.database",
    cond = ide_mode,
  },
  {
    import = "plugins.git",
  },
  {
    import = "plugins.languages.init",
    cond = ide_mode,
  },
  {
    import = "plugins.lsp",
    cond = ide_mode,
  },
  {
    import = "plugins.main",
  },
  {
    import = "plugins.mason",
    cond = ide_mode,
  },
  {
    import = "plugins.motion",
  },
  {
    import = "plugins.others",
  },
  {
    import = "plugins.silly",
    cond = ide_mode,
  },
  {
    import = "plugins.telescope",
  },
  {
    import = "plugins.test",
    cond = ide_mode,
  },
  {
    import = "plugins.ui",
  },
}
