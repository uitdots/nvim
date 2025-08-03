---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "VeryLazy",
  dependencies = "nvim-treesitter/nvim-treesitter",
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["a<C-s>"] = { query = "@local.scope", query_group = "locals", desc = "TSTextObject | Language Scope" },
              ["aC"] = { query = "@comment.outer", desc = "TSTextObject | Arround Comment" },
              ["aa"] = { query = "@parameter.outer", desc = "TSTextObject | Outer Argument/Parameter" },
              ["ac"] = { query = "@class.outer", desc = "TSTextObject | Arround Class" },
              ["af"] = { query = "@function.outer", desc = "TSTextObject | Arround Function/Method" },
              ["iC"] = { query = "@comment.outer", desc = "TSTextObject | Inner Comment" },
              ["ia"] = { query = "@parameter.inner", desc = "TSTextObject | Inner Argument/Parameter" },
              ["ic"] = { query = "@class.inner", desc = "TSTextObject | Inner Class" },
              ["if"] = { query = "@function.inner", desc = "TSTextObject | Inner Function/Method" },
            },
            selection_modes = {
              ["@class.outer"] = "V",
              ["@function.outer"] = "V",
              ["@parameter.outer"] = "v",
            },
            include_surrounding_whitespace = true,
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>tn"] = { query = "@parameter.inner", desc = "TSTextObject | Swap Params Next" },
            },
            swap_previous = {
              ["<leader>tp"] = { query = "@parameter.inner", desc = "TSTextObject | Swap Params Previous" },
            },
          },

          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]<C-s>"] = { query = "@scope", query_group = "locals", desc = "TSTextObject | Next Scope Start" },
              ["]C"] = { query = "@comment.outer", desc = "TSTextObject | Next Comment Start" },
              ["]c"] = { query = "@class.outer", desc = "TSTextObject | Next Class Start" },
              ["]f"] = { query = "@function.outer", desc = "TSTextObject | Next Function/Method Start" },
              ["]i"] = { query = "@conditional.outer", desc = "TSTextObject | Next If" },
              ["]o"] = { query = "@loop.*", desc = "TSTextObject | Next Loop Start" },
              ["]r"] = { query = "@return.outer", desc = "TSTextObject | Next Return" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "TSTextObject | Next Fold Start" },
            },
            goto_previous_start = {
              ["[<C-s>"] = { query = "@scope", query_group = "locals", desc = "TSTextObject | Previous Scope Start" },
              ["[C"] = { query = "@comment.outer", desc = "TSTextObject | Previous Comment Start" },
              ["[c"] = { query = "@class.outer", desc = "TSTextObject | Previous Class Start" },
              ["[f"] = { query = "@function.outer", desc = "TSTextObject | Previous Function/Method Start" },
              ["[i"] = { query = "@conditional.outer", desc = "TSTextObject | Previous If" },
              ["[o"] = { query = "@loop.*", desc = "TSTextObject | Previous Loop Start" },
              ["[r"] = { query = "@return.outer", desc = "TSTextObject | Previous Return" },
              ["[z"] = { query = "@fold", query_group = "folds", desc = "TSTextObject | Previous Fold Start" },
            },
          },
        },
      },
    },
  },
}
