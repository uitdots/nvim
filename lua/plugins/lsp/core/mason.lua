local uitvim_options = require("uitvimrc").options

---@type NvPluginSpec
-- NOTE: This is temporary because mason is unmtained
return {
  "iguanacucumber/mason.nvim",
  branch = "next",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>lm",
      "<CMD>Mason<CR>",
      desc = "LSP | Mason",
      silent = true,
    },
  },
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonInstallAll",
    "MasonUpdate",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  opts = {
    ui = {
      border = uitvim_options.border_enabled and "rounded" or "none",
      check_outdated_packages_on_open = false,
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
      backdrop = 100,
    },
    registries = {
      "github:nvim-java/mason-registry",
      "github:mason-org/mason-registry",
    },
  },
  -- https://www.lazyvim.org/plugins/lsp#masonnvim-1
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require("lazy.core.handler.event").trigger({
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)
  end,
}
