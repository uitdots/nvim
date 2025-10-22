local bo = vim.bo
local filetypes = vim.list_extend({
  "codecompanion",
  "html",
  "tex",
  "typst",
  "xhtml",
  "yaml",
}, require("utils.filetypes").markdown)

---@type LazySpec
return {
  "OXY2DEV/markview.nvim",
  lazy = true, -- Author require this load before nvim-treesitter, but it make blink not lazyloading
  event = "VeryLazy",
  -- ft = ft,
  ---@module 'markview'
  ---@type markview.config
  opts = {
    preview = {
      enable = false,
      enable_hybrid_mode = true,
      filetypes = filetypes,
      -- https://github.com/OXY2DEV/markview.nvim/issues/272
      condition = function(buffer)
        local ft, bt = bo[buffer].ft, bo[buffer].bt
        vim.notify(ft .. " " .. bt)
        return (bt == "nofile" and ft == "codecompanion") or bt ~= "nofile"
      end,
      icon_provider = "devicons",
      modes = {
        "n",
        "no",
        "c",
        "v",
        "V",
        "i",
      },
      hybrid_modes = {
        "i",
      },
      map_gx = false,
    },
  },
  cmd = "Markview",
  keys = {
    {
      "<leader>wv",
      "<cmd>Markview toggle<cr>",
      desc = "Markview | Toggle (local)",
      ft = filetypes,
      silent = true,
    },
    {
      "<leader>wV",
      "<cmd>Markview Toggle<cr>",
      desc = "Markview | Toggle",
      ft = filetypes,
      silent = true,
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "saghen/blink.cmp",
  },
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = "OXY2DEV/markview.nvim",
    },
  },
}
