local lazy_load_on_fts = require("utils.lazy").lazy_load_on_fts

---@type LazySpec
return {
  "qvalentin/helm-ls.nvim",
  lazy = false,
  opts = {},
  config = function(_, opts)
    lazy_load_on_fts("helm-ls", { "helm", "yaml.helm-values" }, opts)
  end,
}
