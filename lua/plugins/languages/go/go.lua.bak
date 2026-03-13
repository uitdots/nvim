---@type LazySpec
return {
  "ray-x/go.nvim",
  ft = {
    "go",
    "gomod",
  },
  opts = {
    disable_defaults = true,
    go = "go",
  },
  config = function(_, opts)
    require("go.commands").add_cmds = function() end
    require("go").setup(opts)
    require("snips.go")
  end,
}
