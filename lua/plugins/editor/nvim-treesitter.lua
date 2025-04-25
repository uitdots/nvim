-- TODO: Clean this up?

---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  cmd = {
    "TSInstall",
    "TSUninstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
    "TSToggle",
    "TSBufToggle",
  },
  opts = {
    highlight = {
      enable = true,
      disable = function()
        -- Disable for chezmoi template file: https://github.com/alker0/chezmoi.vim#-can-i-use-nvim-treesitter-for-my-chezmoi-template
        if string.find(vim.bo.filetype, "chezmoitmpl") then
          return true
        end
      end,
    },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "graphql",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "powershell",
      "python",
      "regex",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    indent = {
      enable = true,
      disable = {
        "markdown", -- indentation at bullet points is worse
        -- "javascript", -- some wrong indentation when using `o`
        -- "typescript",
        "yaml", -- wrong indentation in list continuation
        "dart", -- dart delay: https://github.com/NvChad/NvChad/issues/2237#issuecomment-1653019941
      },
    },
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          ["gn"] = "@parameter.inner",
        },
        swap_previous = {
          ["gp"] = "@parameter.inner",
        },
      },
      move = {
        enable = false,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          --
          -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
          ["]o"] = "@loop.*",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        -- goto_next = {
        --   ["]d"] = "@conditional.outer",
        -- },
        -- goto_previous = {
        --   ["[d"] = "@conditional.outer",
        -- },
      },

      select = {
        enable = true,
        disable = {
          "dart",
        },

        lookahead = true,

        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "V", -- linewise
        },
        include_surrounding_whitespace = true,
      },
    },
  },
  init = function()
    vim.treesitter.language.register("bash", "dotenv")
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      opts = {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      "nvim-treesitter/nvim-treesitter-context",
      init = function()
        vim.keymap.set(
          "n",
          "<leader>oc",
          "<cmd>TSContextToggle<cr>",
          { desc = "Options | Treesitter Toggle Context", silent = true }
        )
        vim.keymap.set("n", "[c", function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end, { desc = "Treesitter | Jumping to context (upwards)", silent = true })
      end,
      opts = {
        enable = false,
      },
    },
    {
      "OXY2DEV/markview.nvim",
      optional = true,
    },
  },
}
