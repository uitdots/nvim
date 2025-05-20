---@type NvPluginSpec
-- NOTE: This is temporary because mason is unmtained
return {
  "mason-org/mason.nvim",
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
  ---@module 'mason'
  ---@type MasonSettings
  opts = {
    PATH = "skip",
    ui = {
      check_outdated_packages_on_open = false,
      backdrop = 100,
    },
    registries = {
      "github:mason-org/mason-registry",
    },
  },
  opts_extend = {
    "registries",
  },
  config = function(_, opts)
    require("mason").setup(opts)

    -- TODO: Idk does this work?
    ---https://www.lazyvim.org/plugins/lsp#masonnvim-1
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
