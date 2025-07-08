local debounce = require("utils.helpers").debounce

---@type LazySpec
return {
  "ckipp01/nvim-jenkinsfile-linter",
  ft = "jenkins",
  config = function()
    local jenkinsfile_linter = require("jenkinsfile_linter")
    local should_enabled = jenkinsfile_linter.check_creds()

    if not should_enabled then
      return
    end

    ---This is really like the way I config nvim lint
    vim.api.nvim_create_autocmd({
      "BufWritePost",
      -- "BufWinEnter",
    }, {
      pattern = "*",
      callback = debounce(function(args)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
        if buftype ~= "jenkins" then
          return
        end
        vim.schedule(jenkinsfile_linter.validate)
      end, 1000),
    })
  end,
  dependencies = "nvim-lua/plenary.nvim",
}
