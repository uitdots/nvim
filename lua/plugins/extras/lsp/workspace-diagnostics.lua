---@type LazySpec
return {
  "artemave/workspace-diagnostics.nvim",
  enabled = false,
  event = {
    "BufRead",
    "BufNewFile",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id) -- TODO: Check this, AI gen for me
        local bufnr = args.buf
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
      end,
      group = vim.api.nvim_create_augroup("lsp-workspace-diagnostics", {}),
    })
  end,
}
