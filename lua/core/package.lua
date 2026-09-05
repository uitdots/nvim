if vim.fn.has("nvim-0.12") == 1 then
  vim.cmd("packadd nvim.undotree")
  -- require("vim._core.ui2").enable({})
end
