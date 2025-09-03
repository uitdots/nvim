---@type LazySpec
return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  opts = function()
    local extra = require("mini.extra")
    return {
      custom_textobjects = {
        a = false,
        gG = extra.gen_ai_spec.buffer(),
      },
    }
  end,
  dependencies = "nvim-mini/mini.extra",
}
