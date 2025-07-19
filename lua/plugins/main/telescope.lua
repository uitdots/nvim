---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  init = function()
    ---TODO: When it handled https://github.com/nvim-telescope/telescope.nvim/issues/3436
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopeFindPre",
      callback = function()
        vim.opt_local.winborder = "none"
        vim.api.nvim_create_autocmd("WinLeave", {
          once = true,
          callback = function()
            vim.opt_local.winborder = "rounded"
          end,
        })
      end,
    })
  end,
  opts = {
    defaults = {
      layout_config = {
        prompt_position = "top", ---@type "top" | "bottom"
      },
      sorting_strategy = "ascending", ---@type "ascending" | "descending"
      path_display = {
        "smart", ---@type "hidden" | "tail" | "absolute" | "smart" | "shorten" | "truncate" | "filename_first"
      },
      file_ignore_patterns = {
        "%.egg-info/",
        "^%.dart_tool/",
        "^%.git/",
        "^%.idea/",
        "^%.next/",
        "^%.venv/",
        "^%.vs/",
        "^.husky/_/",
        "^node_modules/",
        "__pycache__/",
        "bin/",
        "build/",
        "cache/",
        "debug/",
        "dist/",
        "obj/",
      },
    },
  },
}
