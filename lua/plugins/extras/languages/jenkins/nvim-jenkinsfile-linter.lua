local debounce = require("utils.helpers").debounce

---@type NvPluginSpec
return {
  "ckipp01/nvim-jenkinsfile-linter",
  ft = "jenkins",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local jenkinsfile_linter = require("jenkinsfile_linter")

    ---This is really like the way I config nvim lint
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
      pattern = "*",
      callback = debounce(function()
        if vim.bo.filetype ~= "jenkins" then
          return
        end
        vim.schedule(jenkinsfile_linter.validate)
      end, 1000),
    })
  end,
}
