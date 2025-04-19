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
      { args = {
        "lint",
        "--format=json",
        "--dialect=postgres",
      } }
    )

    require("lint").linters_by_ft = {
      -- cpp = { "cpplint" },
      -- javascript = { "eslint" },
      -- javascriptreact = { "eslint" },
      -- markdown = { "markdownlint" },
      -- python = { "ruff" }, -- Already used ruff-lsp
      -- typescript = { "eslint" },
      -- typescriptreact = { "eslint" },
      bash = { "shellcheck" },
      gitcommit = { "commitlint" },
      github = { "actionlint" },
      latex = { "vale" },
      sh = { "shellcheck" },
      -- sql = { "sqlfluff" },
      postgresql = { "postgresql" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
      callback = function()
        require("lint").try_lint()
        -- require("lint").try_lint "codespell"
      end,
    })
  end,
}
