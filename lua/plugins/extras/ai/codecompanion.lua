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
      "<leader>aA",
      "<cmd>CodeCompanionActions<CR>",
      desc = "AI | Actions",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "AI | Add",
      mode = "v",
      silent = true,
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "AI | Toggle",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<CR>",
      desc = "AI | Inline Chat",
      mode = "v",
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
