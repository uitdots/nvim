local lint = require("lint")
local is_executable = require("utils.executable").is_executable
local debounce = require("utils.helpers").debounce
local filter_availabled_external = UitVim.config.filter_availabled_external

---@class nvim_lint_config
local M = {}

---If this is used, it will not have ability to live reload (we called it, not actually right...)
---@private
function M.filter_linters_by_ft()
  for filetype, linters in pairs(lint.linters_by_ft or {}) do
    lint.linters_by_ft[filetype] = vim.tbl_filter(function(linter)
      local cmd = lint.linters[linter].cmd
      -- This because nvim lint has some..., but seem that string is more used than func so prefer string first
      if type(cmd) == "string" then
        return is_executable(lint.linters[linter].cmd)
      end
      return is_executable(lint.linters[linter].cmd())
    end, linters)
  end
end

---@private
function M.extend_global_linters()
  if vim.g.nvimlint_linters_by_ft then
    for k, v in pairs(vim.g.nvimlint_linters_by_ft) do
      lint.linters_by_ft[k] = vim.tbl_deep_extend("force", lint.linters_by_ft[k] or {}, v)
    end
  end
  if vim.g.nvimlint_linters then
    for k, v in pairs(vim.g.nvimlint_linters) do
      lint.linters[k] = vim.tbl_deep_extend("force", lint.linters()[k], v)
    end
  end
end

---@private
function M.setup_autocommands()
  vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
    callback = debounce(function()
      require("lint").try_lint(nil, { ignore_errors = true })
    end, 1000),
  })
end

function M.setup()
  M.extend_global_linters()
  if filter_availabled_external then
    M.filter_linters_by_ft()
  end
  M.setup_autocommands()
end

return M
