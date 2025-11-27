local debounce = require("utils.helpers").debounce
local bo = vim.bo

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
    local lint = require("lint")
    ---@type table<string, table<string, true>>
    local excludes = {
      spellcheck = {
        codecompanion = true,
        bigfile = true,
      },
    }

    vim.api.nvim_create_autocmd({
      "BufWinEnter",
      "BufWritePost",
      "CursorHold",
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
      "CursorHold",
      "InsertLeave",
    }, {
      ---@param args vim.api.keyset.create_autocmd.callback_args
      callback = debounce(function(args)
        if not vim.api.nvim_buf_is_loaded(args.buf) then
          return
        end
        if bo[args.buf].buftype ~= "" or excludes.spellcheck[bo[args.buf].filetype] then
          return
        end
        lint.try_lint("codespell", {
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
