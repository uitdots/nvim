local ft = require("utils.filetypes").markdown

---@type LazySpec
return {
  "brianhuster/live-preview.nvim",
  enabled = false,
  cmd = "LivePreview",
  keys = {
    {
      "<leader>wp",
      function()
        if require("livepreview").is_running() then
          vim.cmd("LivePreview close")
        else
          vim.cmd("LivePreview start")
        end
      end,
      desc = "LivePreview | Toggle",
      ft = ft,
      silent = true,
    },
    {
      "<leader>wP",
      "<cmd>LivePreview pick<CR>",
      desc = "LivePreview | Pick",
      ft = ft,
      silent = true,
    },
  },
  opts = function()
    ---@module 'livepreview'
    ---@type LivePreviewConfig
    return {
      picker = require("livepreview.config").pickers.snacks,
    }
  end,
  config = function(_, opts)
    require("livepreview.config").set(opts)
    vim.cmd("runtime! plugin/livepreview.lua")
  end,
  dependencies = "folke/snacks.nvim",
}
