local is_executable = require("utils.executable").is_executable_cache

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  enabled = is_executable("tree-sitter"),
  ---@module 'nvim-treesitter'
  ---@param opts TSConfig?
  ---@diagnostic disable-next-line: missing-fields
  opts = function(_, opts)
    opts = opts or {}
    opts.ensure_installed = opts.ensure_installed or {}
    ---@diagnostic disable-next-line: param-type-mismatch
    table.insert(opts.ensure_installed, "plantuml")

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    ---@diagnostic disable-next-line: inject-field
    parser_config.plantuml = {
      install_info = {
        url = "https://github.com/Decodetalkers/tree_sitter_plantuml.git",
        files = { "src/parser.c" },
        branch = "gh-pages",
      },
    }
    return opts
  end,
}
