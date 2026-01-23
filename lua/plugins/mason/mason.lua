---@type LazySpec
return {
  "mason-org/mason.nvim",
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
    PATH = "append",
    ui = {
      check_outdated_packages_on_open = false,
      backdrop = 100,
    },
    registries = {
      "github:mason-org/mason-registry",
      "github:uitdots/mason-registry",
    },
  },
  opts_extend = {
    "registries",
  },
}
