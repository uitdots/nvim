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
  version = "*",
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
    show_line_number = false,
    watermark = "",
    snapshot_config = {
      window = {
        mac_window_bar = true,
      },
    },
    code_config = {
      font_family = "JetBrainsMono Nerd Font",
      breadcrumbs = {
        enable = false,
      },
    },
  },
}
