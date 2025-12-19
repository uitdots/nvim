---@type LazySpec
return {
  "icholy/lsplinks.nvim",
  event = {
    "BufRead",
    "BufNewFile",
  },
  config = function()
    require("lsplinks").setup({
      highlight = false,
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "gx", function()
          require("lsplinks").gx()
        end, { buffer = bufnr, desc = "LSP | Open Document Link", silent = true })
      end,
    })
  end,
}
