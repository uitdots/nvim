---@type LazySpec
return {
  "danymat/neogen",
  dependencies = "L3MON4D3/LuaSnip",
  cmd = "Neogen",
  keys = {
    {
      "<leader>l<C-d>",
      function()
        vim.ui.select({
          "auto",
          "func",
          "class",
          "type",
          "file",
        }, {
          prompt = "Select Neogen scheme",
        }, function(scheme)
          if scheme == nil then
            return
          end
          if scheme == "auto" then
            scheme = ""
          end
          vim.cmd("Neogen" .. " " .. scheme)
        end)
      end,
      desc = "LSP | Generate Docs",
      silent = true,
    },
  },
  config = true,
  specs = {
    {
      "L3MON4D3/LuaSnip",
      specs = {
        {
          "danymat/neogen",
          opts = {
            snippet_engine = "luasnip",
          },
          optional = true,
        },
      },
    },
  },
}
