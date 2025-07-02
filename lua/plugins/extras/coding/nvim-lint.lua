local is_executable = require("utils.executable").is_executable
local debounce = require("utils.helpers").debounce
local filter_availabled_external = require("uitvim").options.filter_availabled_external

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

---@type NvPluginSpec
return {
  "mfussenegger/nvim-lint",
  enabled = true,
  event = {
    "BufReadPost",
    "BufNewFile",
  },
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
      "BufWritePost",
      -- "BufWinEnter",
    }, {
      callback = debounce(function()
        require("lint").try_lint(nil, { ignore_errors = true })
      end, 1000),
    })
  end,
}
