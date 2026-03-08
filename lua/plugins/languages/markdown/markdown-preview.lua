local ft = require("utils.filetypes").markdown
local g = vim.g

---@type LazySpec
return {
  "ZiYang-oyxy/markdown-preview.nvim",
  keys = {
    {
      "<leader>wp",
      function()
        vim.cmd("MarkdownPreviewToggle")
        vim.notify(vim.b.MarkdownPreviewToggleBool == 1 and "Started" or "Stopped", vim.log.levels.INFO, {
          title = "Markdown Preview",
          id = "markdown_preview",
        })
      end,
      desc = "MarkdownPreview | Toggle",
      ft = ft,
      silent = true,
    },
    {
      "<leader>wt",
      function()
        if g.mkdp_theme == "light" then
          g.mkdp_theme = "dark"
          vim.notify("Dark Mode", vim.log.levels.INFO, { title = "Markdown Preview", id = "markdown_preview" })
        else
          g.mkdp_theme = "light"
          vim.notify("Light Mode", vim.log.levels.INFO, { title = "Markdown Preview", id = "markdown_preview" })
        end
      end,
      desc = "MarkdownPreview | Toggle Theme",
      ft = ft,
      silent = true,
    },
  },
  build = ":call mkdp#util#install()",
  ft = ft,
  enabled = true,
  init = function()
    g.mkdp_refresh_slow = 1
    g.mkdp_auto_close = false
    g.mkdp_open_to_the_world = 1 -- Open for other to access
    g.mkdp_preview_options = {
      hide_yaml_meta = 0,
      uml = {
        imageFormat = "svg",
      },
    }
  end,
}
