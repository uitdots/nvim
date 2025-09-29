---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = "VeryLazy",
  dependencies = "nvim-treesitter/nvim-treesitter",
  ---@module 'nvim-treesitter-textobjects'
  ---@type TSTextObjects.UserConfig
  opts = {
    select = {
      lookahead = true,
      selection_modes = {
        ["@class.outer"] = "V",
        ["@function.outer"] = "v",
        ["@parameter.outer"] = "v",
      },
      include_surrounding_whitespace = true,
      keymaps = {
        select_textobject = {
          ["a<C-s>"] = { query = "@local.scope", query_group = "locals", desc = "TSTextObject | Language Scope" },
          ["a<M-c>"] = { query = "@conditional.outer", desc = "TSTextObject | Arround Condition" },
          ["aC"] = { query = "@comment.outer", desc = "TSTextObject | Arround Comment" },
          ["aa"] = { query = "@parameter.outer", desc = "TSTextObject | Outer Argument/Parameter" },
          ["ac"] = { query = "@class.outer", desc = "TSTextObject | Arround Class" },
          ["af"] = { query = "@function.outer", desc = "TSTextObject | Arround Function/Method" },
          ["i<M-c>"] = { query = "@conditional.inner", desc = "TSTextObject | Inner Condition" },
          ["iC"] = { query = "@comment.outer", desc = "TSTextObject | Inner Comment" },
          ["ia"] = { query = "@parameter.inner", desc = "TSTextObject | Inner Argument/Parameter" },
          ["ic"] = { query = "@class.inner", desc = "TSTextObject | Inner Class" },
          ["if"] = { query = "@function.inner", desc = "TSTextObject | Inner Function/Method" },
        },
      },
    },
    swap = {
      keymaps = {
        swap_next = {
          ["<leader>tn"] = { query = "@parameter.inner", desc = "TSTextObject | Swap Params Next" },
        },
        swap_previous = {
          ["<leader>tp"] = { query = "@parameter.inner", desc = "TSTextObject | Swap Params Previous" },
        },
      },
    },
    move = {
      set_jumps = true,
      keymaps = {
        goto_next_start = {
          ["]<C-s>"] = { query = "@scope", query_group = "locals", desc = "TSTextObject | Next Scope Start" },
          ["]<M-c>"] = { query = "@conditional.outer", desc = "TSTextObject | Next Condition" },
          ["]C"] = { query = "@comment.outer", desc = "TSTextObject | Next Comment Start" },
          ["]c"] = { query = "@class.outer", desc = "TSTextObject | Next Class Start" },
          ["]f"] = { query = "@function.outer", desc = "TSTextObject | Next Function/Method Start" },
          ["]o"] = { query = "@loop.*", desc = "TSTextObject | Next Loop Start" },
          ["]r"] = { query = "@return.outer", desc = "TSTextObject | Next Return" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "TSTextObject | Next Fold Start" },
        },
        goto_previous_start = {
          ["[<C-s>"] = { query = "@scope", query_group = "locals", desc = "TSTextObject | Previous Scope Start" },
          ["[<M-c>"] = { query = "@conditional.outer", desc = "TSTextObject | Previous Condition" },
          ["[C"] = { query = "@comment.outer", desc = "TSTextObject | Previous Comment Start" },
          ["[c"] = { query = "@class.outer", desc = "TSTextObject | Previous Class Start" },
          ["[f"] = { query = "@function.outer", desc = "TSTextObject | Previous Function/Method Start" },
          ["[o"] = { query = "@loop.*", desc = "TSTextObject | Previous Loop Start" },
          ["[r"] = { query = "@return.outer", desc = "TSTextObject | Previous Return" },
          ["[z"] = { query = "@fold", query_group = "folds", desc = "TSTextObject | Previous Fold Start" },
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter-textobjects").setup(opts)
    local map = vim.keymap.set

    for select_func, select_values in pairs(opts.select.keymaps) do
      for select_keymap, select_keymap_value in pairs(select_values) do
        map({ "x", "o" }, select_keymap, function()
          require("nvim-treesitter-textobjects.select")[select_func](select_keymap_value["query"], select_keymap_value["query_group"])
        end, {
          desc = select_keymap_value["desc"],
          silent = true,
        })
      end
    end

    for swap_func, swap_values in pairs(opts.swap.keymaps) do
      for swap_keymap, swap_keymap_value in pairs(swap_values) do
        map("n", swap_keymap, function()
          require("nvim-treesitter-textobjects.swap")[swap_func](swap_keymap_value["query"], swap_keymap_value["query_group"])
        end, {
          desc = swap_keymap_value["desc"],
          silent = true,
        })
      end
    end

    for move_func, move_values in pairs(opts.move.keymaps) do
      for move_keymap, move_keymap_value in pairs(move_values) do
        map({ "n", "x", "o" }, move_keymap, function()
          require("nvim-treesitter-textobjects.move")[move_func](move_keymap_value["query"], move_keymap_value["query_group"])
        end, {
          desc = move_keymap_value["desc"],
          silent = true,
        })
      end
    end
  end,
}
