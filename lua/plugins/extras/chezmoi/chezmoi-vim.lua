---@type LazySpec
return {
  "alker0/chezmoi.vim",
  lazy = false,
  init = function()
    -- This option is required.
    vim.g["chezmoi#use_tmp_buffer"] = true

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "chezmoitmpl",
      callback = function()
        vim.cmd("TSBufDisable highlight")
      end,
    })
  end,
}
