local o = vim.o

---@type LazySpec
return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  init = function()
    o.foldcolumn = "1"
    o.foldlevel = 99
    o.foldlevelstart = 99
    o.foldenable = true
  end,
  ---@module 'ufo'
  ---@type UfoConfig
  opts = {
    close_fold_kinds_for_ft = {
      default = {
        "imports",
      },
    },
    preview = {
      win_config = {
        winblend = vim.o.winblend,
      },
    },
  },
  keys = {
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      desc = "Nvim UFO | Open All Folds",
      silent = true,
    },
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "Nvim UFO | Close All Folds",
      silent = true,
    },
    {
      "zr",
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      desc = "Nvim UFO | Open Folds Except Kinds",
      silent = true,
    },
    {
      "zm",
      function()
        require("ufo").closeFoldsWith()
      end,
      desc = "Nvim UFO | Close Folds With",
      silent = true,
    },
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      desc = "Nvim UFO | Peek Fold or LSP Hover",
      silent = true,
    },
  },
  main = "ufo",
  dependencies = "kevinhwang91/promise-async",
}
