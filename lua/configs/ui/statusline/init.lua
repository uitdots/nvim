---@type table<string, string | fun(): string?>
local M = {
  auto_format = require("configs.ui.statusline.auto-format"),
  codecompanion = require("configs.ui.statusline.codecompanion"),
  command = require("configs.ui.statusline.command"),
  end_of_line = require("configs.ui.statusline.end-of-line"),
  flutter = require("configs.ui.statusline.flutter"),
  formatters = require("configs.ui.statusline.formatters"),
  harpoon = require("configs.ui.statusline.harpoon"),
  line_percentage = require("configs.ui.statusline.line-percentage"),
  linters = require("configs.ui.statusline.linters"),
  lsps = require("configs.ui.statusline.lsps"),
  macro_recording = require("configs.ui.statusline.macro-recording"),
  python_venv = require("configs.ui.statusline.python-venv"),
  separator = require("configs.ui.statusline.separator"),
}

return M
