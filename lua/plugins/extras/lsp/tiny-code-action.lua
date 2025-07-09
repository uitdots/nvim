---@type LazySpec
return {
  "rachartier/tiny-code-action.nvim",
  event = "LspAttach",
  opts = {
    backend = "vim", ---@type "vim" | "delta" | "difftastic" | "diffsofancy"
    picker = {
      "snacks",
    },
  },
}
