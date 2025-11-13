---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "thenbe/neotest-playwright",
      cmd = {
        "NeotestPlaywrightPreset",
        "NeotestPlaywrightProject",
        "NeotestPlaywrightRefresh",
      },
      keys = {
        {
          "<leader>T<leader>a",
          function()
            ---@diagnostic disable-next-line: undefined-field
            require("neotest").playwright.attachment()
          end,
          desc = "Neotest | Playwright Show Attachment",
        },
      },
      specs = {
        {
          "nvim-neotest/neotest",
          opts = function(_, opts)
            opts = opts or {}
            opts.adapters = opts.adapters or {}
            opts.consumers = opts.consumers or {}

            local adapter_opts = {
              options = {
                persist_project_selection = false,
                enable_dynamic_test_discovery = true,
                get_playwright_binary = function()
                  local bin_path = vim.fn.exepath("playwright")
                  if bin_path ~= "" then
                    return bin_path
                  end
                  return vim.loop.cwd() .. "/node_modules/.bin/playwright"
                end,
              },
            }
            table.insert(opts.adapters, require("neotest-playwright").adapter(adapter_opts))

            opts.consumers.playwright = require("neotest-playwright.consumers").consumers
            return opts
          end,
        },
      },
    },
  },
  optional = true,
}
