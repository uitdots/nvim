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
  opts = {
    highlights = {
      matchparen = {
        enabled = false,
      },
    },
  },
  config = true,
  dependencies = "saghen/blink.download",
}
