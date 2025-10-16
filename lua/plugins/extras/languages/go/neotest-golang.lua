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
            local test_opts = {
              go_test_args = {
                "-v",
                "-race",
                "-count=1",
                "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
              },
            }
            table.insert(opts.adapters, require("neotest-golang")(test_opts))
          end,
        },
      },
    },
  },
  optional = true,
}
