---@type LazySpec
return {
  "weirongxu/plantuml-previewer.vim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>wp",
      "<cmd>PlantumlToggle<CR>",
      desc = "Writing | Toggle PlantUML Preview",
      ft = "plantuml",
      silent = true,
    },
  },
}
