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

    lint.linters_by_ft["*"] = {
      "cspell",
      "codespell",
    }
  end,
  config = function()
    vim.api.nvim_create_autocmd({
      "BufWinEnter",
      "BufWritePost",
      "InsertLeave",
    }, {
      callback = debounce(function()
        require("lint").try_lint(nil, {
          ignore_errors = true,
        })
      end, 1000),
    })

    vim.api.nvim_create_autocmd({
      "BufWinEnter",
      "BufWritePost",
    }, {
      callback = debounce(function()
        require("lint").try_lint("codespell", {
          ignore_errors = true,
        })
      end, 1000),
    })
  end,
  keys = {
    ---This is for manually triggering checking (spell, security check,...)
    {
      "<leader>ll",
      function()
        require("lint").try_lint({
          "codespell",
          "cspell",
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
