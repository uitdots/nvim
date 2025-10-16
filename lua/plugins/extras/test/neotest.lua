---@type LazySpec
return {
  "nvim-neotest/neotest",
  enabled = true,
  opts = {
    status = {
      virtual_text = true,
    },
    output = {
      open_on_run = true,
    },
  },
  keys = {
    {
      "<leader>Ta",
      function()
        require("neotest").run.attach()
      end,
      desc = "Neotest | Attach",
    },
    {
      "<leader>TF",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Neotest | All Files",
    },
    {
      "<leader>Ts",
      function()
        require("neotest").run.run({
          suite = true,
        })
      end,
      desc = "Neotest | Suite",
    },
    {
      "<leader>TO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Neotest | Toggle Output Panel",
    },
    {
      "<leader>TT",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Neotest | Toggle Summary",
    },
    {
      "<leader>Tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Neotest | File",
    },
    {
      "<leader>Tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Neotest | Last",
    },
    {
      "<leader>Tn",
      function()
        require("neotest").run.run()
      end,
      desc = "Neotest | Nearest",
    },
    {
      "<leader>To",
      function()
        require("neotest").output.open({
          enter = true,
          auto_close = true,
        })
      end,
      desc = "Neotest | Output",
    },
    {
      "<leader>Ts",
      function()
        require("neotest").run.stop()
      end,
      desc = "Neotest | Stop",
    },
    {
      "<leader>Tw",
      function()
        require("neotest").watch.toggle(vim.fn.expand("%"))
      end,
      desc = "Neotest | Toggle Watch",
    },
    {
      "<leader>Td",
      function()
        require("neotest").run.run({
          suite = false,
          strategy = "dap",
        })
      end,
      desc = "Neotest | Debug Nearest",
    },
    {
      "<leader>Td",
      function()
        require("neotest").run.run({
          vim.fn.expand("%"),
          suite = false,
          strategy = "dap",
        })
      end,
      desc = "Neotest | Debug Current File",
    },
  },
  ---@param opts PluginsOpts.NeotestOpts
  config = function(_, opts)
    ---Taken from lazyvim
    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        ---@type neotest.Adapter | table
        local adapter = require(name)

        if config ~= false then
          ---@type table?
          local adapter_opts
          local adapter_opts_type = type(config)
          if adapter_opts_type == "table" then
            adapter_opts = config
          elseif adapter_opts_type == "function" then
            adapter_opts = config()
          end
          local meta = getmetatable(adapter)
          if adapter.setup then
            adapter.setup(adapter_opts)
          elseif adapter.adapter then
            adapter.adapter(adapter_opts)
            adapter = adapter.adapter
          elseif meta and meta.__call then
            adapter = adapter(adapter_opts)
          else
            error("Adapter " .. name .. " does not support setup")
          end
        end

        adapters[#adapters + 1] = adapter
      end
      opts.adapters = adapters
    end

    require("neotest").setup(opts)
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
