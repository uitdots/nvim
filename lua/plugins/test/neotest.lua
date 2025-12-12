local wo = vim.wo

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
    discovery = {
      enabled = false,
    },
    summary = {
      animated = false,
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
    {
      "gF",
      -- https://github.com/nvim-neotest/neotest/issues/387#issuecomment-2409133005
      function()
        local current_word = vim.fn.expand("<cWORD>")
        local tokens = vim.split(current_word, ":", { trimempty = true })
        local win_ids = vim.api.nvim_list_wins()
        local widest_win_id = -1
        local widest_win_width = -1
        for _, win_id in ipairs(win_ids) do
          if vim.api.nvim_win_get_config(win_id).zindex then
            goto continue
          end
          local win_width = vim.api.nvim_win_get_width(win_id)
          if win_width > widest_win_width then
            widest_win_width = win_width
            widest_win_id = win_id
          end
          ::continue::
        end
        vim.api.nvim_set_current_win(widest_win_id)
        if #tokens == 1 then
          vim.cmd("e " .. tokens[1])
        else
          vim.cmd("e +" .. tokens[2] .. " " .. tokens[1])
        end
      end,
      desc = "Neotest | Open File Under Cursor in Widest Window",
      ft = "neotest-output",
      silent = true,
    },
  },
  config = function(_, opts)
    require("neotest").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
      },
      callback = function(args)
        local buf = args.buf
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == buf then
            local _wo = wo[win]
            _wo.number = false
            _wo.relativenumber = false
            _wo.signcolumn = "no"
            _wo.foldcolumn = "0"
          end
        end
      end,
    })
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
