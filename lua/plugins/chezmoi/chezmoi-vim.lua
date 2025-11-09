---@type LazySpec
return {
  "alker0/chezmoi.vim",
  lazy = false,
  init = function()
    -- This option is required.
    vim.g["chezmoi#use_tmp_buffer"] = true

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "chezmoitmpl",
      callback = function(args)
        vim.treesitter.stop(args.buf)
      end,
    })
  end,
}
