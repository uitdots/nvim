---@type NvPluginSpec
return {
  {
    "NvChad/NvChad",
    optional = true,
    keys = {
      {
        "<leader>f<C-t>",
        "<cmd>Telescope terms<cr>",
        desc = "Find | Terminal",
        silent = true,
      },
      {
        "<C-x>",
        "<C-\\><C-N>",
        desc = "Terminal | Escape Terminal Mode",
        mode = "t",
        silent = true,
      },
      {
        "<leader><C-t>n",
        function()
          require("nvchad.term").new()
        end,
        desc = "Terminal | New",
        silent = true,
      },
      {
        "<leader><C-t>v",
        function()
          require("nvchad.term").toggle({ pos = "vsp", id = "veritcal" })
        end,
        desc = "Terminal | Vertical Toggle",
        silent = true,
      },
      {
        "<leader><C-t>V",
        function()
          require("nvchad.term").new({ pos = "vsp" })
        end,
        desc = "Terminal | Vertical New",
        silent = true,
      },
      {
        "<leader><C-t>h",
        function()
          require("nvchad.term").toggle({ pos = "sp", id = "horizontal" })
        end,
        desc = "Terminal | Horizontal Toggle",
        silent = true,
      },
      {
        "<leader><C-t>H",
        function()
          require("nvchad.term").new({ pos = "sp" })
        end,
        desc = "Terminal | Horizontal New",
        silent = true,
      },
      {
        "<leader><C-t>f",
        function()
          require("nvchad.term").toggle({ pos = "float", id = "float" })
        end,
        desc = "Terminal | Float Toggle",
        silent = true,
      },
      {
        "<leader><C-t>F",
        function()
          require("nvchad.term").new({ pos = "float" })
        end,
        desc = "Terminal | Float New",
        silent = true,
      },
      -- Use builtin runner, because this is suck
      -- {
      --   "<leader>Tr",
      --   function()
      --     local open_term = function(cmd)
      --       require("nvchad.term").runner({
      --         pos = "sp",
      --         cmd = cmd,
      --         id = "code-runner",
      --         clear_cmd = false,
      --       })
      --     end
      --     require("configs.code-runner").run(open_term)
      --   end,
      --   desc = "Terminal | Code Runner",
      --   silent = true,
      -- },
    },
  },
}
