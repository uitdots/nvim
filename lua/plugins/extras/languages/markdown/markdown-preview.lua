local ft = require("utils.filetypes").markdown

---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown | Toggle Preview",
      ft = ft,
      silent = true,
    },
    {
      "<leader>mt",
      function()
        if vim.g.mkdp_theme == "light" then
          vim.g.mkdp_theme = "dark"
          vim.notify("Dark Mode", vim.log.levels.INFO, { title = "Markdown Preview", id = "markdown_preview" })
        else
          vim.g.mkdp_theme = "light"
          vim.notify("Light Mode", vim.log.levels.INFO, { title = "Markdown Preview", id = "markdown_preview" })
        end
      end,
      desc = "Markdown | Toggle Preview Theme",
      ft = ft,
      silent = true,
    },
  },
  build = ":call mkdp#util#install()",
  ft = ft,
  enabled = true,
  init = function()
    vim.g.mkdp_auto_close = false
    vim.g.mkdp_open_to_the_world = 1 -- Open for other to access
    vim.g.mkdp_port = 65530
  end,
}
