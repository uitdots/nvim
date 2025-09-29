---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter'
  ---@param opts PluginsOpts.TSConfig?
  opts = function(_, opts)
    opts = opts or {}
    opts.ensure_installed = opts.ensure_installed or {}
    ---@diagnostic disable-next-line: param-type-mismatch
    table.insert(opts.ensure_installed, "plantuml")

    ---@diagnostic disable-next-line: inject-field
    require("nvim-treesitter.parsers").plantuml = {
      install_info = {
        url = "https://github.com/Decodetalkers/tree_sitter_plantuml.git",
        files = { "src/parser.c" },
        branch = "gh-pages",
      },
    }
    return opts
  end,
}
