---@type LazySpec
return {
  "ThePrimeagen/refactoring.nvim",
  cmd = "Refactor",
  keys = {
    {
      "<leader>Rs",
      function()
        -- require("refactoring").select_refactor()
        require("telescope").extensions.refactoring.refactors()
      end,
      desc = "Refactor | Select",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>Ri",
      "<cmd>Refactor inline_var<cr>",
      desc = "Refactor | Extract Inline Variable",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>RI",
      "<cmd>Refactor inline_func<cr>",
      desc = "Refactor | Extract Inline Function",
      silent = true,
    },
    {
      "<leader>Rb",
      "<cmd>Refactor extract_block<cr>",
      desc = "Refactor | Extract Block",
      silent = true,
    },
    {
      "<leader>RB",
      "<cmd>Refactor extract_block_to_file<cr>",
      desc = "Refactor | Extract Block to File",
      silent = true,
    },
    {
      "<leader>Re",
      "<cmd>Refactor extract<cr>",
      desc = "Refactor | Extract",
      silent = true,
      mode = "v",
    },
    {
      "<leader>Rf",
      "<cmd>Refactor extract_to_file<cr>",
      desc = "Refactor | Extract to File",
      silent = true,
      mode = "v",
    },
    {
      "<leader>Rv",
      "<cmd>Refactor extract_var<cr>",
      desc = "Refactor | Extract Variable",
      silent = true,
    },
    {
      "<leader>Rn",
      "<cmd>Refactor refactor_names<cr>",
      desc = "Refactor | Names",
      silent = true,
    },
  },
  opts = {
    prompt_func_return_type = {
      c = false,
      cpp = false,
      cxx = false,
      go = false,
      h = false,
      hpp = false,
      java = false,
    },
    prompt_func_param_type = {
      c = false,
      cpp = false,
      cxx = false,
      go = false,
      h = false,
      hpp = false,
      java = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = false,
  },
  main = "refactoring",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
