---@type LazySpec
return {
  "nvim-neotest/neotest",
  specs = {
    {
      "StevanFreeborn/neotest-playwright",
      branch = "fork",
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
      config = function()
        require("neotest-playwright.preset").create_preset_command()
        require("neotest-playwright.project").create_project_command()
        require("neotest-playwright.commands").create_refresh_command()
      end,
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
                  local fname = vim.api.nvim_buf_get_name(0)
                  local bin = vim.fs.find("node_modules/.bin/playwright", { path = fname, upward = true })[1]
                  if bin then
                    return bin
                  else
                    return "playwright"
                  end
                end,
                get_playwright_config = function()
                  local fname = vim.api.nvim_buf_get_name(0)
                  return vim.fs.find("/playwright.config.ts", { path = fname, upward = true })[1]
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
