---@type LazySpec
return {
  "johmsalas/text-case.nvim",
  keys = {
    { "g<M-a>", desc = "GoTo | Text Case" },
    {
      "g<M-a>.",
      "<cmd>TextCaseOpenTelescope<CR>",
      mode = { "n", "v" },
      desc = "GoTo | Text Case Telescope",
    },
  },
  cmd = {
    "Subs",
    "TextCaseOpenTelescope",
    "TextCaseOpenTelescopeQuickChange",
    "TextCaseOpenTelescopeLSPChange",
    "TextCaseStartReplacingCommand",
  },
  opts = {
    prefix = "g<M-a>",
  },
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      specs = {
        {
          "johmsalas/text-case.nvim",
          opts = function(_, opts)
            require("telescope").load_extension("text-case")
            return opts
          end,
        },
      },
    },
  },
}
