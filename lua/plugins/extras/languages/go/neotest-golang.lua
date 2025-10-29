---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "fredrikaverpil/neotest-golang",
      specs = {
        {
          "nvim-neotest/neotest",
          opts = function(_, opts)
            opts = opts or {}
            opts.adapters = opts.adapters or {}

            ---@module 'neotest-golang'
            ---@type NeotestGolangOptions
            ---@diagnostic disable-next-line: missing-fields
            local adapter_opts = {
              env = {
                CGO_ENABLED = 1,
              },
              go_test_args = {
                "-v",
                "-race",
                "-count=1",
                "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
              },
            }
            table.insert(opts.adapters, require("neotest-golang")(adapter_opts))
            return opts
          end,
        },
      },
    },
  },
  optional = true,
}
