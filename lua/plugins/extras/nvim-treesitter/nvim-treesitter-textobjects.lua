---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
      opts = {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = { query = "@parameter.outer", desc = "TSTextObject | Outer Param/Argument" },
              ["ac"] = { query = "@class.outer", desc = "TSTextObject | Arround Class" },
              ["af"] = { query = "@function.outer", desc = "TSTextObject | Arround Function" },
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "TSTextObject | Language Scope" },
              ["ia"] = { query = "@parameter.inner", desc = "TSTextObject | Inner Param/Argument" },
              ["ic"] = { query = "@class.inner", desc = "TSTextObject | Inner Class" },
              ["if"] = { query = "@function.inner", desc = "TSTextObject | Inner Function" },
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
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next = {
              ["]S"] = { query = "@scope", query_group = "locals", desc = "TSTextObject | Next Scope Start" },
              ["]c"] = { query = "@class.outer", desc = "TSTextObject | Next Class Start" },
              ["]i"] = { query = "@conditional.outer", desc = "TSTextObject | Next If" },
              ["]m"] = { query = "@function.outer", desc = "TSTextObject | Next Method/Function Start" },
              ["]o"] = { query = "@loop.*", desc = "TSTextObject | Next Loop Start" },
              ["]r"] = { query = "@return.outer", desc = "TSTextObject | Next Return" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "TSTextObject | Next Fold Start" },
            },
            goto_previous = {
              ["[S"] = { query = "@scope", query_group = "locals", desc = "TSTextObject | Previous Scope Start" },
              ["[c"] = { query = "@class.outer", desc = "TSTextObject | Previous Class Start" },
              ["[i"] = { query = "@conditional.outer", desc = "TSTextObject | Previous If" },
              ["[m"] = { query = "@function.outer", desc = "TSTextObject | Previous Method/Function Start" },
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
