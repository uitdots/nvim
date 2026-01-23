---@type LazySpec
return {
  "kevinhwang91/nvim-hlslens",
  cmd = {
    "HlSearchLensDisable",
    "HlSearchLensEnable",
    "HlSearchLensToggle",
  },
  keys = {
    {
      "n",
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      mode = "n",
      silent = true,
    },
    {
      "N",
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      mode = "n",
      silent = true,
    },
    {
      "*",
      [[*<Cmd>lua require('hlslens').start()<CR>]],
      mode = "n",
      silent = true,
    },
    {
      "#",
      [[#<Cmd>lua require('hlslens').start()<CR>]],
      mode = "n",
      silent = true,
    },
    {
      "g*",
      [[g*<Cmd>lua require('hlslens').start()<CR>]],
      mode = "n",
      silent = true,
    },
    {
      "g#",
      [[g#<Cmd>lua require('hlslens').start()<CR>]],
      mode = "n",
      silent = true,
    },
  },
  config = true,
}
