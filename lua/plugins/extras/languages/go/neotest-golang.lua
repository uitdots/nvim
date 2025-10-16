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
            table.insert(opts.adapters, require("neotest-golang")())
          end,
        },
      },
    },
  },
  optional = true,
}
