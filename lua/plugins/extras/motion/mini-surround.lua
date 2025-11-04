---@type LazySpec
return {
  "nvim-mini/mini.surround",
  event = "VeryLazy",
  opts = {
    mappings = {
      add = "ysa",
      delete = "ysd",
      find = "ysf",
      find_left = "ysF",
      highlight = "ysh",
      replace = "ysr",
    },
  },
}
