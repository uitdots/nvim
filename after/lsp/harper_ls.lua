local methods = vim.lsp.protocol.Methods
---@type vim.lsp.Config
return {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = false,
        relativePatternSupport = false,
      },
    },
  },
  settings = {
    ["harper-ls"] = {
      dialect = "British",
      linters = {
        ToDoHyphen = false,
      },
    },
  },
  flags = {
    debounce_text_changes = 2000,
  },
  handlers = {
    -- Because harper insist asking neovim to watch whole workspace?
    [methods.client_registerCapability] = function(err, res, ctx)
      local registration = res.registrations[1]
      if registration and registration.method == methods.workspace_didChangeWatchedFiles then
        return vim.NIL
      end
      return vim.lsp.handlers[methods.client_registerCapability](err, res, ctx)
    end,
  },
}
