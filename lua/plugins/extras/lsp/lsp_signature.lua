local ide_mode = require("utils.os").ide_mode

---@type LazySpec
return {
  "ray-x/lsp_signature.nvim",
  cond = ide_mode,
  event = "VeryLazy",
}
