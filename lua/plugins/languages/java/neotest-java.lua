---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "rcasia/neotest-java",
      specs = {
        {
          "nvim-neotest/neotest",
          opts = function(_, opts)
            ---@type string
            local jar = vim.fn.glob("$MASON/share/junit/junit-platform-console-standalone.jar", false, false)

            opts = opts or {}
            opts.adapters = opts.adapters or {}

            local adapter_opts = {
              junit_jar = jar ~= "" and jar or nil,
            }
            table.insert(opts.adapters, require("neotest-java")(adapter_opts))
            return opts
          end,
        },
      },
    },
  },
  optional = true,
}
