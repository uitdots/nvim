local autocmd = vim.api.nvim_create_autocmd
local wo = vim.wo

---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<CR>",
      desc = "CodeCompanion | Actions",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "CodeCompanion | Add Current to Chat",
      mode = "v",
      silent = true,
    },
    {
      "<leader>ac",
      function()
        vim.cmd("CodeCompanionChat Toggle")
        if vim.g.nvdash_displayed then
          require("nvchad.tabufline").close_buffer(vim.g.nvdash_buf)
        end
      end,
      desc = "CodeCompanion | Toggle Chat",
      silent = true,
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<CR>",
      desc = "CodeCompanion | Inline Chat",
      mode = { "n", "v" },
      silent = true,
    },
  },
  init = function()
    vim.cmd("cab cc CodeCompanion")

    autocmd({ "User" }, {
      pattern = "CodeCompanionRequest*",
      callback = function(request)
        if request.match == "CodeCompanionRequestStarted" then
          -- vim.notify("Request started...", vim.log.levels.INFO, {
          --   title = "CodeCompanion",
          --   icon = "󱙺",
          --   id = "codecompanion_request_start",
          -- })
          vim.g.codecompanion_requesting = true
        elseif request.match == "CodeCompanionRequestFinished" then
          -- vim.notify("Request finished", vim.log.levels.INFO, {
          --   title = "CodeCompanion",
          --   icon = "󱙺",
          --   id = "codecompanion_request_end",
          -- })
          vim.g.codecompanion_requesting = nil
        end
      end,
    })

    autocmd("FileType", {
      pattern = "codecompanion",
      callback = function(args)
        local buf = args.buf
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == buf then
            local _wo = wo[win]
            _wo.number = false
            _wo.relativenumber = false
            _wo.foldenable = false
          end
        end
      end,
      desc = "Window Options for CodeCompanion",
    })
  end,
  opts = {
    strategies = {
      chat = {
        slash_commands = {
          image = {
            opts = {
              dirs = {
                "./assets/",
                "~/Downloads/",
                "~/Pictures/",
              },
            },
          },
        },
        keymaps = {
          regenerate = {
            modes = {
              n = "g<M-r>", -- Because this conflict with lsp action
            },
          },
        },
      },
    },
    prompt_library = {
      ["Justfile docs"] = {
        strategy = "chat",
        description = "Ask about Justfile documentation",
        opts = {},
        context = {
          {
            type = "url",
            url = "https://raw.githubusercontent.com/casey/just/refs/heads/master/README.md",
          },
        },
        prompts = {
          {},
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "OXY2DEV/markview.nvim",
      optional = true,
    },
    {
      "echasnovski/mini.diff",
      optional = true,
    },
    {
      "HakonHarnes/img-clip.nvim",
      optional = true,
    },
  },
  specs = {
    {
      "OXY2DEV/markview.nvim",
      optional = true,
      ---@module 'markview'
      ---@param opts? markview.config
      opts = function(_, opts)
        opts = opts or {}
        opts.preview = opts.preview or {}
        opts.preview.ignore_buftypes = opts.preview.ignore_buftypes or {}

        autocmd("FileType", {
          pattern = "codecompanion",
          callback = function(args)
            local markview_cmd = require("markview.commands")
            markview_cmd.enable(args.buf)
            markview_cmd.hybridEnable(args.buf)
          end,
        })
        return opts
      end,
    },
    {
      "HakonHarnes/img-clip.nvim",
      optional = true,
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
    {
      "Saghen/blink.cmp",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        sources = {
          per_filetype = {
            codecompanion = {},
          },
        },
      },
      optional = true,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      ---@type PluginsOpts.TSConfig
      opts = {
        fold = {
          disable = {
            "codecompanion",
          },
        },
      },
    },
  },
}
