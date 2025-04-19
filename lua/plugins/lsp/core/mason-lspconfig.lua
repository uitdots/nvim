---@type NvPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  opts = {
    handlers = {
      function(server_name)
        vim.lsp.enable(server_name)
      end,
      ["eslint"] = function()
        require("configs.lspconfig").old_lspconfig("eslint")
      end,
      ["ts_ls"] = function() end,
      ["rust_analyzer"] = function() end,
      ["jdtls"] = function() end,
    },
  },
}
