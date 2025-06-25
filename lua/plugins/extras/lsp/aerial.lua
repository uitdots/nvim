---@type NvPluginSpec
return {
  "stevearc/aerial.nvim",
  cmd = {
    "AerialToggle",
    "AerialNavToggle",
  },
  keys = {
    {
      "<leader>lo",
      "<cmd>AerialToggle<cr>",
      desc = "LSP | Outline",
      silent = true,
    },
    {
      "<leader>ln",
      "<cmd>AerialNavToggle<cr>",
      desc = "LSP | Nav",
      silent = true,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filter_kind = {
      -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
      "Array",
      "Boolean",
      "Class",
      "Constant",
      "Constructor",
      "Enum",
      "EnumMember",
      "Event",
      "Field",
      "File",
      "Function",
      "Interface",
      -- "Key",
      "Method",
      "Module",
      "Namespace",
      "Null",
      "Number",
      "Object",
      -- "Operator",
      "Package",
      "Property",
      "String",
      "Struct",
      -- "TypeParameter",
      "Variable",
    },
    nav = {
      win_opts = {
        winblend = vim.o.winblend,
      },
    },
  },
}
