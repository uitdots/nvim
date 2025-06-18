---@type table<string, string | fun(): string?>
local M = {
  end_of_line = require("configs.ui.statusline.end-of-line"),
  lsps = require("configs.ui.statusline.lsps"),
  line_percentage = require("configs.ui.statusline.line-percentage"),
  macro_recording = require("configs.ui.statusline.macro-recording"),
  codecompanion = require("configs.ui.statusline.codecompanion"),
  command = require("configs.ui.statusline.command"),
  auto_format = require("configs.ui.statusline.auto-format"),
  linters = require("configs.ui.statusline.linters"),
  formatters = require("configs.ui.statusline.formatters"),
  python_venv = require("configs.ui.statusline.python-venv"),
  flutter = require("configs.ui.statusline.flutter"),
  separator = require("configs.ui.statusline.separator"),
}

return M
