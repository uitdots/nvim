---@type LazySpec
return {
  "nvim-neotest/neotest",
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
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
