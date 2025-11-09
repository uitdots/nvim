---@type LazySpec
return {
  "rcarriga/cmp-dap",
  specs = {
    {
      "Saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          providers = {
            dap = {
              name = "dap",
              module = "blink.compat.source",
            },
          },
          per_filetype = {
            ["dap-repl"] = {
              "dap",
            },
            dapui_watches = {
              "dap",
            },
            dapui_hover = {
              "dap",
            },
          },
        },
      },
    },
  },
  dependencies = {
    "Saghen/blink.cmp",
    "Saghen/blink.compat",
  },
}
