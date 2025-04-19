---@type NvPluginSpec
return {
  "danymat/neogen",
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  cmd = "Neogen",
  config = true,
  keys = {
    {
      "<leader>ld",
      function()
        vim.ui.select({ "auto", "func", "class", "type", "file" }, {
          prompt = "Select Neogen scheme",
          telescope = require("telescope.themes").get_dropdown(),
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
      desc = "Neogen | Generate Docs",
      silent = true,
    },
  },
  opts = {
    snippet_engine = "luasnip",
  },
}
