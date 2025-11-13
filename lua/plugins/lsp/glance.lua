local map = vim.keymap.set

---@type LazySpec
return {
  "DNLHC/glance.nvim",
  cmd = "Glance",
  init = function()
    map("n", "gd", "<cmd>Glance definitions<CR>", { desc = "LSP Definitions" })
    map("n", "gri", "<cmd>Glance implementations<CR>", { desc = "LSP Implementations" })
    map("n", "grr", "<cmd>Glance references<CR>", { desc = "LSP References" })
    map("n", "grt", "<cmd>Glance type_definitions<CR>", { desc = "LSP Type Definitions" })
  end,
  config = true,
}
