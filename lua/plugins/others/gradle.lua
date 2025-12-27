---@type LazySpec
return {
  "oclay1st/gradle.nvim",
  optional = true,
  cmd = {
    "Gradle",
    "GradleExec",
    "GradleInit",
  },
  keys = {
    {
      "<localleader>jg",
      "<cmd>Gradle<CR>",
      desc = "Java | Gradle",
    },
  },
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
