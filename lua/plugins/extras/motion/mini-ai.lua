---@type LazySpec
return {
  "echasnovski/mini.ai",
  event = "VeryLazy",
  opts = function()
    local extra = require("mini.extra")
    return {
      custom_textobjects = {
        a = false,
        i = extra.gen_ai_spec.indent(),
        e = extra.gen_ai_spec.buffer(),
      },
    }
  end,
  dependencies = "echasnovski/mini.extra",
}
