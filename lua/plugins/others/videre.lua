---@type LazySpec
return {
  "Owen-Dechow/videre.nvim",
  optional = true,
  keys = {
    {
      "<leader>qv",
      "<cmd>Videre<CR>",
      desc = "Videre | Toggle",
      silent = true,
      ft = {
        "bigfile",
        "json",
        "json5",
        "jsonc",
        "plist",
        "toml",
        "xaml",
        "xml",
        "yaml",
        "yaml.github",
        "yaml.helm-values",
      },
    },
  },
  opts = {
    floating_editor_style = {
      border = vim.o.winborder,
    },
  },
}
