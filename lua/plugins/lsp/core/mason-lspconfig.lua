---@type NvPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  -- NOTE: Change this to normal table when lsp is fully supported
  opts = function(_, opts)
    local server_names = require("preferences").old_lsps_mason
    local old_lspconfig = require("configs.lspconfig").old_lspconfig

    opts = opts or {}
    opts.handlers = {
      function(server_name)
        vim.lsp.enable(server_name)
      end,
      ["eslint"] = function() end,
      ["ts_ls"] = function() end,
      ["rust_analyzer"] = function() end,
      ["jdtls"] = function() end,
    }

    for _, server_name in pairs(server_names) do
      opts.handlers[server_name] = function()
        old_lspconfig(server_name)
      end
    end
  end,
}
