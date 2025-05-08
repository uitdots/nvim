---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  keys = {
    "Telescope",
  },
  opts = {
    defaults = {
      layout_config = {
        prompt_position = "top", ---@type "top" | "bottom"
      },
      sorting_strategy = "ascending", ---@type "ascending" | "descending"
      path_display = {
        "smart", ---@type "hidden" | "tail" | "absolute" | "smart" | "shorten" | "truncate" | "filename_first"
      },
      file_ignore_patterns = {
        "%.egg-info/",
        "^%.dart_tool/",
        "^%.git/",
        "^%.idea/",
        "^%.next/",
        "^%.venv/",
        "^%.vs/",
        "^.husky/_/",
        "^node_modules/",
        "__pycache__/",
        "bin/",
        "build/",
        "cache/",
        "debug/",
        "dist/",
        "obj/",
      },
    },
  },
}
