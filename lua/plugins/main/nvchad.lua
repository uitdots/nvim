local lsp = require("configs.lsp")
local ft_no_navigate = {
  "dap-view",
  "dbui",
  "dbout",
  "codecompanion",
  "avante",
}

---@type LazySpec
return {
  "NvChad/NvChad",
  lazy = false, -- Because this contains colorscheme
  branch = "v2.5",
  keys = {
    {
      "H",
      function()
        if vim.tbl_contains(ft_no_navigate, vim.bo.filetype) then
          return
        end
        require("nvchad.tabufline").prev()
      end,
      desc = "General | Previous Buffer",
      silent = true,
    },
    {
      "L",
      function()
        if vim.tbl_contains(ft_no_navigate, vim.bo.filetype) then
          return
        end
        require("nvchad.tabufline").next()
      end,
      desc = "General | Next Buffer",
      silent = true,
    },
    {
      "<leader>ft",
      function()
        require("telescope").extensions.themes.themes()
        -- require("nvchad.themes").open()
      end,
      desc = "Telescope | Themes",
    },
    {
      "<leader>nc",
      "<cmd>NvCheatsheet<cr>",
      desc = "NvChad | Cheatsheet",
      silent = true,
    },
    {
      "<leader>f<M-t>",
      "<cmd>Telescope terms<cr>",
      desc = "Telescope | Terminal",
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
  config = function()
    require("nvchad.lsp").diagnostic_config()
    require("configs.diagnostic")
  end,
  specs = {
    {
      "mason-org/mason.nvim",
      ---@module 'mason'
      ---@param opts MasonSettings?
      ---@return MasonSettings
      opts = function(_, opts)
        return vim.tbl_deep_extend("keep", opts or {}, require("nvchad.configs.mason"))
      end,
      optional = true,
    },
    {
      "neovim/nvim-lspconfig",
      opts = function()
        local nvchad_capabilities = require("nvchad.configs.lspconfig").capabilities
        lsp.capabilities = vim.tbl_deep_extend("keep", lsp.capabilities, nvchad_capabilities)
      end,
      optional = true,
    },
    {
      "saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@param opts? blink.cmp.Config
      opts = function(_, opts)
        opts = opts or {}
        opts.completion = opts.completion or {}
        opts.completion.menu = vim.tbl_deep_extend("force", opts.completion.menu or {}, require("nvchad.blink").menu)
        return opts
      end,
    },
  },
}
