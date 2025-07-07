local is_executable = require("utils.executable").is_executable
---https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/tex.lua
---@type LazySpec
return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
    vim.g.vimtex_quickfix_method = is_executable("pplatex") and "pplatex" or "latexlog" ---@type "pplatex" | "latexlog" | "pulp"
    vim.g.vimtex_view_method = "zathura" ---@type "general" | "mupdf" | "skim" | "zathura" | "zathura_simple"
  end,
  keys = {
    { "<localLeader>l", ft = "tex" },
  },
}
