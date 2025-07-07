---@type LazySpec
return {
  "rachartier/tiny-code-action.nvim",
  opts = {
    backend = "vim", ---@type "vim" | "delta" | "difftastic" | "diffsofancy"
    picker = {
      "snacks",
    },
  },
}
