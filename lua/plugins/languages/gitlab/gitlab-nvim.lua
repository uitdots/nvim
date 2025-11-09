-- local is_executable = require("utils.executable").is_executable_cache

---@type LazySpec
return {
  "harrisoncramer/gitlab.nvim",
  enabled = false,
  -- enabled = not filter_availabled_external or is_executable("go"),
  build = function()
    require("gitlab.server").build(true)
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim",
    {
      "nvim-tree/nvim-web-devicons",
      optional = true,
    },
  },
  config = true,
}
