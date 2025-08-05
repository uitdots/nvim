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
  config = function(_, opts)
    require("textcase").setup(opts)
    ---@param extension string
    pcall(function(extension)
      return require("telescope").load_extension(extension)
    end, "text-case")
  end,
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
    },
  },
}
