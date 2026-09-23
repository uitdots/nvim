---@type LazySpec
return {
  "dmtrKovalenko/fff.nvim",
  lazy = false,
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  ---@module 'fff'
  ---@type FffConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    prompt = "> ",
    ---@diagnostic disable-next-line: missing-fields
    layout = {
      prompt_position = "top",
    },
    ---@diagnostic disable-next-line: missing-fields
    keymaps = {
      ---@diagnostic disable-next-line: assign-type-mismatch
      close = { "<C-c>" },
    },
    hl = {
      matched = "TelescopeMatching",
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fff").find_files()
      end,
      desc = "FFF | Files",
    },
    {
      "<leader>fw",
      function()
        require("fff").live_grep()
      end,
      desc = "FFF | Grep Words",
    },
    {
      "<leader>fs",
      function()
        local s_pos = vim.fn.getpos("v")
        local e_pos = vim.fn.getpos(".")
        local lines = vim.fn.getregion(s_pos, e_pos, { type = vim.fn.mode() })
        local text = table.concat(lines, "\n")
        require("fff").live_grep({ query = vim.fn.expand(text) })
      end,
      desc = "FFF | Search String",
      mode = "v",
    },
  },
}
