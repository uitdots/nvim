local ft = require("utils.filetypes").markdown
local is_executable = require("utils.executable").is_executable_cache

---@type LazySpec
return {
  "hostmyapps-git/live-preview.nvim",
  enabled = is_executable("pnpm") or is_executable("npm"),
  build = string.format("%s install --prefix .", is_executable("pnpm") and "pnpm" or "npm"),
  lazy = false,
  cmd = {
    "LivePreview",
    "LivePreviewStop",
    "LivePreviewDebug",
    "LivePreviewHelper",
  },
  keys = {
    {
      "<leader>wp",
      "<cmd>LivePreview<CR>",
      desc = "LivePreview | Toggle",
      ft = ft,
      silent = true,
    },
  },
  init = function()
    vim.g.live_preview_options = {
      plantuml = {
        server = "https://www.plantuml.com/plantuml",
      },
    }
  end,
}
