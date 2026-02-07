local debounce = require("utils.helpers").debounce

---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  opts = function()
    local lint = require("lint")

    lint.linters_by_ft.gitcommit = {
      "commitlint",
    }
  end,
  config = function()
    local try_lint = function()
      require("lint").try_lint(nil, {
        ignore_errors = true,
      })
    end

    vim.api.nvim_create_autocmd({
      "BufWinEnter",
      "BufWritePost",
      "CursorHold",
      "InsertLeave",
    }, {
      callback = debounce(try_lint, 500),
    })

    vim.api.nvim_create_autocmd({
      "CursorHoldI",
    }, {
      callback = debounce(try_lint, 1000),
    })
  end,
  keys = {
    {
      "<leader>ll",
      function()
        require("lint").try_lint({
          "codespell",
          "cspell",
          "typos",
        }, {
          ignore_errors = true,
        })
      end,
      desc = "LSP | Lint Others",
    },
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      optional = true,
    },
  },
}
