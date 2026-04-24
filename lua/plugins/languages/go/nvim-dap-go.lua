---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      -- "leoluz/nvim-dap-go",
      "sk91/nvim-dap-go",
      branch = "feat/remote-attach-mode",
      config = true,
    },
  },
  optional = true,
}
