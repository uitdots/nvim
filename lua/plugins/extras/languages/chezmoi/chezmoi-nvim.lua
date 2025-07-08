---@type LazySpec
return {
  "xvzc/chezmoi.nvim",
  init = function()
    local exclude_patterns = {
      [[.*chezmoi.*chezmoi.*]],
    }

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = {
        (vim.fn.expand("~")):gsub("\\", "/") .. "/.local/share/chezmoi/home/*",
      },
      callback = function(args)
        local file = vim.fn.expand("%:p")
        for _, pattern in ipairs(exclude_patterns) do
          if file:match(pattern) then
            return
          end
        end
        local edit_watch = function()
          require("chezmoi.commands.__edit").watch(args.buf)
        end
        vim.schedule(edit_watch)
      end,
    })
  end,
  opts = {
    edit = {
      watch = true,
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
