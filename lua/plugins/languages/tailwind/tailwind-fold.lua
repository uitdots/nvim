---@type LazySpec
return {
  "razak17/tailwind-fold.nvim",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "TailwindFoldDisable",
    "TailwindFoldEnable",
    "TailwindFoldToggle",
  },
  ft = {
    "html",
    "svelte",
    "astro",
    "vue",
    "typescriptreact",
    "php",
    "blade",
  },
}
