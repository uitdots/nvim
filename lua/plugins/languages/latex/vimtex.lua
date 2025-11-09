local is_executable = require("utils.executable").is_executable
---https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/tex.lua
---@type LazySpec
return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    local g = vim.g
    g.vimtex_mappings_disable = {
      ["n"] = { "K" },
    }
    g.vimtex_quickfix_method = is_executable("pplatex") and "pplatex" or "latexlog" ---@type "pplatex" | "latexlog" | "pulp"
    g.vimtex_view_method = "zathura" ---@type "general" | "mupdf" | "skim" | "zathura" | "zathura_simple"
    g.vimtex_view_forward_search_on_start = 0 ---@type 0 | 1

    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = { "tex" },
    --   callback = function()
    --     vim.schedule(function()
    --       vim.wo.conceallevel = 2
    --     end)
    --   end,
    -- })
  end,
  keys = {
    { "<localLeader>l", ft = "tex" },
  },
}
