---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = {
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
    "MasonToolsClean",
  },
  opts = {
    run_on_start = false,
    integrations = {
      ["mason-lspconfig"] = true,
      ["mason-null-ls"] = false,
      ["mason-nvim-dap"] = false,
    },
    ---@type Mason.Package[]
    ensure_installed = {
      "typos",
      "typos-lsp",
    },
  },
  opts_extend = {
    "ensure_installed",
  },
  dependencies = "mason-org/mason.nvim",
}
