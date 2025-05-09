---@module 'conform'

local filter_availabled_external = require("uitvim").options.filter_availabled_external

local M = {}

---@private
---@type conform.setupOpts
M.opts = {
  lsp_format = "fallback",
}

M.opts.formatters = {
  doctoc = {
    append_args = {
      "--update-only",
    },
  },
  ["markdown-toc"] = {
    append_args = {
      "--bullets=-",
    },
  },
  prettier = {
    append_args = {
      "--ignore-gitignore", -- Format file which ignored by .gitignore
    },
  },
  beautysh = {
    append_args = {
      "--indent-size=2",
    },
  },
  ruff_fix = {
    append_args = {
      "--select=I",
      -- "--ignore=F401", -- Unused import
    },
  },
  pg_sqlfluff = vim.tbl_extend("force", require("conform.formatters.sqlfluff"), {
    append_args = {
      "--dialect=postgres",
    },
  }),
}

M.opts.formatters_by_ft = {
  mysql = {
    "mysql_formatter",
  },
  postgresql = {
    "pg_sqlfluff",
  },
}

M.opts.format_after_save = function(bufnr) -- Async format
  -- Disable with a global or buffer-local variable
  if not vim.g.autoformat_enabled or vim.b[bufnr].autoformat_enabled then
    return
  end
  -- Disable autoformat for files in a certain path
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  if bufname:match("/node_modules/") then
    return
  end
  return {}
end

---@private
function M.filter_availabled_formatters()
  for filetype, formatters in pairs(M.opts.formatters_by_ft) do
    ---@cast formatters string[]
    M.opts.formatters_by_ft[filetype] = function(bufnr)
      return vim.tbl_filter(function(formatter)
        return require("conform").get_formatter_info(formatter, bufnr).available
      end, formatters)
    end
  end
end

---@private
function M.extend_global_formatters()
  if vim.g.conform_formatters then
    for k, v in pairs(vim.g.conform_formatters) do
      ---@diagnostic disable-next-line: param-type-mismatch due to
      M.opts.formatters[k] = vim.tbl_deep_extend("force", M.opts.formatters[k] or {}, v)
    end
  end
end

function M.setup()
  M.extend_global_formatters()
  if filter_availabled_external then
    M.filter_availabled_formatters()
  end
  require("conform").setup(M.opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
