---@type NvPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  opts = {
    handlers = {
      function(server_name)
        vim.lsp.enable(server_name)
      end,
      ["rust_analyzer"] = function() end,
      ["jdtls"] = function() end,
      ["ruff"] = function() end,
    },
  },
}
