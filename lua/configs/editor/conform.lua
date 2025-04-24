---@module 'conform'

local filter_availabled_external = require("uitvimrc").options.filter_availabled_external

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
  clang_format = {
    append_args = {
      "--fallback-style=Microsoft",
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
  c = {
    "clang_format",
  },
  cpp = {
    "clang_format",
  },
  cs = {
    "clang_format",
  },
  css = {
    "prettier",
  },
  graphql = {
    "prettier",
  },
  html = {
    "prettier",
  },
  javascript = {
    "prettier",
  },
  javascriptreact = {
    "prettier",
  },
  json = {
    "prettier",
  },
  jsonc = {
    "prettier",
  },
  less = {
    "prettier",
  },
  lua = {
    "stylua",
  },
  ["markdown.mdx"] = {
    "prettier",
    "doctoc",
  },
  markdown = {
    "prettier",
    "doctoc",
  },
  mysql = {
    "mysql_formatter",
  },
  python = {
    "ruff_fix",
    "ruff_format",
    -- "ruff_organize_imports", -- Should be set in config, so that ruff_fix can do that
  },
  scss = {
    "prettier",
  },
  sh = {
    "shfmt",
  },
  dotenv = {
    "shfmt",
  },
  postgresql = {
    "pg_sqlfluff",
  },
  typescript = {
    "prettier",
  },
  typescriptreact = {
    "prettier",
  },
  vue = {
    "prettier",
  },
  yaml = {
    "prettier",
  },
  zsh = {
    "beautysh",
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

function M.setup()
  if filter_availabled_external then
    M.filter_availabled_formatters()
  end
  require("conform").setup(M.opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
