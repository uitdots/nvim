---@type LazySpec
return {
  "andythigpen/nvim-coverage",
  cmd = {
    "Coverage",
    "CoverageClear",
    "CoverageHide",
    "CoverageLoad",
    "CoverageLoadLcov",
    "CoverageShow",
    "CoverageSummary",
    "CoverageToggle",
  },
  keys = {
    {
      "<leader>Tc",
      "<cmd>Coverage<CR>",
      desc = "Coverage | Coverage",
      silent = true,
    },
    {
      "<leader>TC",
      "<cmd>CoverageClear<CR>",
      desc = "Coverage | Clear",
      silent = true,
    },
    {
      "<leader>Tt",
      "<cmd>CoverageToggle<CR>",
      desc = "Coverage | Toggle",
      silent = true,
    },
    {
      "<leader>TS",
      "<cmd>CoverageSummary<CR>",
      desc = "Coverage | Summary",
      silent = true,
    },
  },
  ---@module 'coverage'
  ---@type Configuration
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    auto_reload = true,
    ---@diagnostic disable-next-line: missing-fields
    summary = {
      window = {
        winblend = 0,
      },
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
