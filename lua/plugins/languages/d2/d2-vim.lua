local g = vim.g
local fn = vim.fn
local api = vim.api

---@type LazySpec
return {
  "terrastruct/d2-vim",
  ft = "d2",
  init = function()
    g.loaded_d2 = 1
    g.d2_fmt_autosave = 0
  end,
  keys = {
    {
      "<leader>wd",
      "<cmd>D2PreviewSelection<cr>",
      desc = "D2 | Preview",
      ft = "d2",
      mode = "v",
    },
    {
      "<leader>wr",
      "<cmd>D2ReplaceSelection<cr>",
      desc = "D2 | Replace",
      ft = "d2",
      mode = "v",
    },
    {
      "<leader>wD",
      "<cmd>D2PreviewCopy<cr>",
      ft = "d2",
      desc = "D2 | Preview & Copy",
    },
  },
  config = function()
    fn["d2#add_default_block_string_syntaxes"]()
    fn["d2#sync_markdown_fenced_languages"]()

    api.nvim_create_user_command("D2PreviewSelection", function(opts)
      fn["d2#ascii#PreviewSelection"](opts.line1, opts.line2)
    end, { range = true })

    api.nvim_create_user_command("D2ReplaceSelection", function(opts)
      fn["d2#ascii#ReplaceSelection"](opts.line1, opts.line2)
    end, { range = true })

    api.nvim_create_user_command("D2PreviewCopy", function()
      fn["d2#ascii#CopyPreview"]()
    end, {})

    local group = api.nvim_create_augroup("d2_syntax_post", { clear = true })
    api.nvim_create_autocmd("Syntax", {
      group = group,
      pattern = "d2",
      callback = function()
        fn["d2#syntax_post"]()
      end,
    })
  end,
}
