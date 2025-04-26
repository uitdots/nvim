local lint = require("lint")
local is_executable = require("core.utils").is_executable
local debounce = require("core.utils").debounce

---@class nvim_lint_config
local M = {}

---@private
function M._config_linters()
  lint.linters.pg_sqlfluff = vim.tbl_deep_extend(
    "force",
    ---@diagnostic disable-next-line: param-type-mismatch
    lint.linters.sqlfluff,
    {
      args = {
        "lint",
        "--format=json",
        "--dialect=postgres",
      },
    }
  )
end

---If this is used, it will not have ability to live reload (we called it, not actually right...)
---@private
function M._filter_linters_by_ft()
  for filetype, linters in pairs(M._linters_by_ft) do
    M._linters_by_ft[filetype] = vim.tbl_filter(function(linter)
      if lint.linters[linter] == nil then
        return false
      end
      return is_executable(lint.linters[linter].cmd)
    end, linters)
  end
end

---@private
---@type table<string, string[]>
M._linters_by_ft = {
  cpp = {
    "cpplint",
  },
  gitcommit = {
    "commitlint",
  },
  javascript = {
    -- "eslint",
  },
  javascriptreact = {
    -- "eslint",
  },
  markdown = {
    "markdownlint",
  },
  python = {
    "ruff", -- don't use this, use ruff lsp instead
  },
  sql = {
    "sqlfluff",
  },
  typescript = {
    -- "eslint",
  },
  typescriptreact = {
    -- "eslint",
  },
  bash = {
    "shellcheck",
  },
  github = {
    "actionlint",
  },
  -- latex = {
  --   "vale",
  -- },
  postgresql = {
    "pg_sqlfluff",
  },
  sh = {
    "shellcheck",
  },
  ["*"] = {
    "codespell",
  },
}

function M._config_linters_by_ft()
  lint.linters_by_ft = M._linters_by_ft
end

---@private
function M._setup_autocommands()
  vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
    callback = debounce(function()
      require("lint").try_lint(nil, { ignore_errors = true })
      -- require("lint").try_lint "codespell"
    end, 1000),
  })
end

function M.setup()
  M._config_linters()
  -- FIXME: Currently use ignore_errors = true to ignore those linter doesn't exist. But we want to filter those first for runtime perf
  -- M._filter_linters_by_ft()
  M._config_linters_by_ft()
  M._setup_autocommands()
end

return M
