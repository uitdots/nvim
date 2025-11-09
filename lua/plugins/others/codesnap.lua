local function ask_ext(cmd)
  vim.ui.input({
    prompt = "Specify Code Extension (optional)",
  }, function(ext)
    vim.cmd(cmd .. " " .. ext)
  end)
end

---@type LazySpec
return {
  "mistricky/codesnap.nvim",
  enabled = vim.fn.has("win32") == 0,
  build = "make",
  cmd = {
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapASCII",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
  },
  keys = {
    {
      "<leader>sS",
      function()
        ask_ext("CodeSnap")
      end,
      desc = "Snap | Save to Clipboard",
      silent = true,
      mode = "x",
    },
    {
      "<leader>ss",
      function()
        ask_ext("CodeSnapSave")
      end,
      desc = "Snap | Save",
      silent = true,
      mode = "x",
    },
    {
      "<leader>sa",
      function()
        ask_ext("CodeSnapASCII")
      end,
      desc = "Snap | Save ASCII to Clipboard",
      silent = true,
      mode = "x",
    },
    {
      "<leader>sh",
      function()
        ask_ext("CodeSnapHighlight")
      end,
      desc = "Snap | Save Highlight to Clipboard",
      silent = true,
      mode = "x",
    },
    {
      "<leader>sH",
      function()
        ask_ext("CodeSnapSaveHighlight")
      end,
      desc = "Snap | Save Highlight",
      silent = true,
      mode = "x",
    },
  },
  opts = {
    bg_theme = "summer",
    bg_x_padding = 10,
    bg_y_padding = 8,
    code_font_family = "JetBrainsMono Nerd Font",
    mac_window_bar = true,
    title = "",
    watermark = "",
    has_line_number = true,
    watermark_font_family = "JetBrainsMono Nerd Font",
  },
}
