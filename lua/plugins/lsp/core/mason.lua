local uitvim_options = require("uitvim").options

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
  opts = function()
    ---@type MasonSettings
    local opts = {
      PATH = "skip",
      ui = {
        border = uitvim_options.border_enabled and "rounded" or "none",
        check_outdated_packages_on_open = true,
        backdrop = 100,
      },
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    }
    vim.tbl_deep_extend("keep", opts, require("nvchad.configs.mason"))

    return opts
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
