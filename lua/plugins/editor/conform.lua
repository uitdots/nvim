---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = function(_, opts)
    opts.formatters = {
      ["doctoc"] = {
        append_args = {
          "--update-only",
        },
      },
      ["markdown-toc"] = {
        append_args = {
          "--bullets=-",
        },
      },
      ["prettier"] = {
        append_args = {
          "--ignore-gitignore", -- Format file which ignored by .gitignore
          "--single-quote",
          -- "--jsx-single-quote", -- NOTE: Don't use this if you want all jsx to be single quote
        },
      },
      ["beautysh"] = {
        append_args = {
          "--indent-size=2",
        },
      },
      ["clang_format"] = {
        append_args = {
          "--fallback-style=Microsoft",
        },
      },
      ["ruff_fix"] = {
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
      -- ["mysql_formatter"] = {
      --   command = "sql-formatter",
      --   args = {
      --     "--language=mysql",
      --   },
      -- },
      -- ["plsql_formatter"] = {
      --   command = "sql-formatter",
      --   args = {
      --     "--language=plsql",
      --   },
      -- },
      -- ["postgresql_formatter"] = {
      --   command = "sql-formatter",
      --   args = {
      --     "--language=postgresql",
      --   },
      -- },
      -- ["tsql_formatter"] = {
      --   command = "sql-formatter",
      --   args = {
      --     "--language=tsql",
      --   },
      -- },
    }

    opts.formatters_by_ft = {
      -- c = { "clang_format" },
      -- cpp = { "clang_format" },
      -- cs = { "clang_format" },
      css = { "prettier" },
      flow = { "prettier" },
      -- go = { "gofumpt" },
      graphql = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      less = { "prettier" },
      lua = { "stylua" },
      ["markdown.mdx"] = { "prettier", "doctoc" },
      markdown = { "prettier", "doctoc" },
      mysql = { "mysql_formatter" },
      python = {
        "ruff_fix",
        "ruff_format",
        -- "ruff_organize_imports", -- Should be set in config, so that ruff_fix can do that
      },
      scss = { "prettier" },
      sh = { "shfmt" },
      dotenv = { "shfmt" },
      postgresql = { "pg_sqlfluff" },
      -- plsql = { "plsql_formatter" },
      -- postgresql = { "postgresql_formatter" },
      -- sql = { "sql_formatter" },
      -- sqloracle = { "sql_formatter" },
      -- tsql = { "tsql_formatter" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      yaml = { "prettier" },
      zsh = { "beautysh" },
    }

    opts.format_after_save = function(bufnr) -- Async format
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") then
        return
      end
      return {}
    end

    opts.default_format_opts = {
      lsp_format = "fallback",
    }
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
