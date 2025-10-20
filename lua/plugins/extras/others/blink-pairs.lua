---@type LazySpec
return {
  "Saghen/blink.pairs",
  version = "*",
  event = {
    "BufRead",
    "BufNewFile",
  },
  --- @module 'blink.pairs'
  --- @type blink.pairs.Config
  opts = nil,
  config = true,
  dependencies = "saghen/blink.download",
}
