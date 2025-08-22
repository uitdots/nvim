---@type LazySpec
return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = vim.o.winborder,
    },
    hint_enable = false,
    always_trigger = false,
    toggle_key = "<C-k>",
    select_signature_key = "<M-n>",
    move_cursor_key = "<C-S-k>",
    move_signature_window_key = {
      "<M-j>",
      "<M-k>",
    },
  },
}
