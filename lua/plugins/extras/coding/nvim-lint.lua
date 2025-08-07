local is_executable = require("utils.executable").is_executable
local debounce = require("utils.helpers").debounce
local filter_availabled_external = require("preferences").options.others.filter_availabled_external

local function filter_avaiable()
  local lint = require("lint")
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
    }
  end,
  config = function()
    if filter_availabled_external then
      filter_avaiable()
    end

    vim.api.nvim_create_autocmd({
      "InsertLeave",
      "BufWinEnter",
    }, {
      callback = debounce(function()
        require("lint").try_lint(nil, {
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
          "trivy",
        }, {
          ignore_errors = true,
        })
      end,
      desc = "LSP | Lint Others",
    },
  },
}
