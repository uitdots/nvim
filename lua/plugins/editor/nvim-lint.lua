-- TODO: So...

---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  enabled = true,
  config = function()
    local linters = require("lint").linters

    linters.postgresql = vim.tbl_deep_extend(
      "force",
      ---@diagnostic disable-next-line: param-type-mismatch
      linters.sqlfluff,
      {
        args = {
          "lint",
          "--format=json",
          "--dialect=postgres",
        },
      }
    )

    require("lint").linters_by_ft = {
      -- cpp = { "cpplint" },
      -- gitcommit = { "commitlint" },
      -- javascript = { "eslint" },
      -- javascriptreact = { "eslint" },
      -- markdown = { "markdownlint" },
      -- python = { "ruff" }, -- Already used ruff-lsp
      -- sql = { "sqlfluff" },
      -- typescript = { "eslint" },
      -- typescriptreact = { "eslint" },
      bash = { "shellcheck" },
      github = { "actionlint" },
      latex = { "vale" },
      postgresql = { "postgresql" },
      sh = { "shellcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
      callback = function()
        require("lint").try_lint()
        -- require("lint").try_lint "codespell"
      end,
    })
  end,
}
