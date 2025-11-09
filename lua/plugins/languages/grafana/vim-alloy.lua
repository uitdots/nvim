---@type LazySpec
return {
  "grafana/vim-alloy",
  lazy = false,
  init = function()
    vim.g.alloy_fmt_on_save = 1
  end,
}
