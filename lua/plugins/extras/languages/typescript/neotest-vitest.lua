---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "marilari88/neotest-vitest",
      specs = {
        {
          "nvim-neotest/neotest",
          opts = function(_, opts)
            opts = opts or {}
            opts.adapters = opts.adapters or {}

            table.insert(opts.adapters, require("neotest-vitest"))
            return opts
          end,
        },
      },
    },
  },
  optional = true,
}
