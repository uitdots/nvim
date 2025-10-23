---@type LazySpec
return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>qs", desc = "Send request" },
    { "<leader>qa", desc = "Send all requests" },
    { "<leader>qb", desc = "Open scratchpad" },
    { "<leader>qu", desc = "Manage Auth Config" },
  },
  ft = {
    "http",
    "rest",
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>q",
    lsp = {
      formatter = true,
    },
  },
}
