---@type NvPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  -- NOTE: Change this to normal table when lsp is fully supported
  config = function(_, opts)
    local old_server_names = require("uitvim").old_lsps
    local no_setup_server_names = require("uitvim").no_setup_lsps
    local mason_available_server_names = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package

    opts = opts or {}
    opts.handlers = {
      function(server_name)
        vim.lsp.enable(server_name)
      end,
    }

    -- Ye I know this is duplicate code but I hope there's a better way to iterate multiple table once
    for _, server_name in pairs(old_server_names) do
      if mason_available_server_names[server_name] ~= nil then
        opts.handlers[server_name] = function() end
      end
    end
    for _, server_name in pairs(no_setup_server_names) do
      if mason_available_server_names[server_name] ~= nil then
        opts.handlers[server_name] = function() end
      end
    end
  end,
}
