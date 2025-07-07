local home = require("utils.os").home

---@type LazySpec
-- NOTE:
-- Type ":Lazy load vim-wakatime" to generate ".wakatime.cfg".
-- You only need to do this once.
-- To disable, remove "~./wakatime.cfg".
return {
  "wakatime/vim-wakatime",
  event = vim.fn.filereadable(home .. "/.wakatime.cfg") == 1 and "VeryLazy" or nil,
}
