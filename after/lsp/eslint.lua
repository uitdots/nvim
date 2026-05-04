---@type vim.lsp.Config
return {
  before_init = function(params, config) end,
  ---@module 'lspconfig'
  ---@type lspconfig.settings.eslint
  settings = {
    eslint = {
      autoFixOnSave = true,
      format = {
        enable = false,
      },
      quiet = true,
      run = "onSave",
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine",
        },
      },
      codeActionsOnSave = {
        enable = true,
        mode = "all",
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Idk why there is an override of on_attach that I cannot inherit from neovim lspconfig
    -- Just copy from that
    vim.api.nvim_buf_create_user_command(bufnr, "LspEslintFixAll", function()
      client:request_sync("workspace/executeCommand", {
        command = "eslint.applyAllFixes",
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      }, nil, bufnr)
    end, {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
  ---@diagnostic disable-next-line: missing-fields
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
  },
}
