---@type NvPluginSpec
return {
  "olimorris/codecompanion.nvim",
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<CR>",
      desc = "AI | Actions",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "AI | Add Current to Chat",
      mode = "v",
      silent = true,
    },
    {
      "<leader>ac",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "AI | Toggle Chat",
      mode = "n",
      silent = true,
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<CR>",
      desc = "AI | Inline Chat",
      mode = { "n", "v" },
      silent = true,
    },
  },
  init = function()
    vim.cmd("cab cc CodeCompanion")
  end,
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "ravitemer/mcphub.nvim",
      optional = true,
    },
    {
      "echasnovski/mini.diff",
      optional = true,
    },
    {
      "OXY2DEV/markview.nvim",
      optional = true,
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "codecompanion",
          callback = function()
            vim.schedule(function()
              vim.cmd("Markview enable")
              vim.cmd("Markview hybridEnable")
            end)
          end,
        })
      end,
    },
  },
}
