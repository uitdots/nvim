local lspconfig = require("configs.lsp.lspconfig")

---@type NvPluginSpec
return {
  {
    "NvChad/NvChad",
    branch = "v2.5",
    init = function()
      vim.api.nvim_create_user_command("NvChadMasonInstallAll", function()
        require("nvchad.mason").install_all()
      end, { desc = "NvChad Mason Install All" })

      lspconfig.capabilities = vim.tbl_deep_extend("keep", lspconfig.capabilities, require("nvchad.configs.lspconfig").capabilities)

      local original_lspconfig_setup = lspconfig.setup
      ---@diagnostic disable-next-line: duplicate-set-field This is intentional
      function lspconfig.setup()
        require("nvchad.lsp").diagnostic_config()
        original_lspconfig_setup()
      end
    end,
    keys = {
      {
        "H",
        function()
          require("nvchad.tabufline").prev()
        end,
        desc = "General | Previous Buffer",
        silent = true,
      },
      {
        "L",
        function()
          require("nvchad.tabufline").next()
        end,
        desc = "General | Next Buffer",
        silent = true,
      },
      {
        "<leader>c",
        function()
          require("nvchad.tabufline").close_buffer()
        end,
        desc = "General | Close Buffer",
        silent = true,
      },
      {
        "<leader>C",
        function()
          require("nvchad.tabufline").closeAllBufs(false)
        end,
        desc = "General | Close Other Buffers",
        silent = true,
      },
      {
        "<leader>nh",
        function()
          require("nvchad.tabufline").closeBufs_at_direction("left")
        end,
        desc = "General | Close Buffers from Left",
        silent = true,
      },
      {
        "<leader>nl",
        function()
          require("nvchad.tabufline").closeBufs_at_direction("right")
        end,
        desc = "Neovim | Close Buffers from Right",
        silent = true,
      },
      {
        "<leader>ft",
        function()
          require("telescope").extensions.themes.themes()
          -- require("nvchad.themes").open()
        end,
        desc = "Find | Themes",
      },
      {
        "<leader>nc",
        "<cmd>NvCheatsheet<cr>",
        desc = "Neovim | Cheatsheet",
        silent = true,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    ---@module 'mason'
    ---@param opts MasonSettings?
    ---@return MasonSettings
    opts = function(_, opts)
      return vim.tbl_deep_extend("keep", opts, require("nvchad.configs.mason"))
    end,
  },
}
