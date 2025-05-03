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
  ---@type function:MasonSettings
  ---@param opts MasonSettings?
  opts = function(_, opts)
    ---@type MasonSettings
    local _opts = {
      PATH = "skip",
      ui = {
        check_outdated_packages_on_open = true,
        backdrop = 100,
      },
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    }
    return vim.tbl_deep_extend("keep", _opts, require("nvchad.configs.mason"), opts or {})
  end,
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
