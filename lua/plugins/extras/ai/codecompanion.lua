local autocmd = vim.api.nvim_create_autocmd

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
        if vim.g.nvdash_displayed then
          require("nvchad.tabufline").close_buffer(vim.g.nvdash_buf)
        end
        vim.cmd("CodeCompanionChat Toggle")
      end,
      desc = "CodeCompanion | Toggle Chat",
      mode = "n",
      silent = true,
    },
    {
      "<leader>aI",
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
          vim.g.codecompanion_requesting = true
        elseif request.match == "CodeCompanionRequestFinished" then
          vim.g.codecompanion_requesting = nil
        end
      end,
    })
    autocmd("FileType", {
      pattern = "codecompanion",
      callback = function()
        vim.schedule(function()
          vim.wo.number = false
          vim.wo.relativenumber = false
        end)
      end,
      desc = "No line number in CodeCompanion",
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
      ["GNU Make"] = {
        strategy = "chat",
        description = "Ask about GNU Make documentation",
        opts = {},
        context = {
          {
            type = "url",
            url = "https://www.gnu.org/software/make/manual/make.txt",
          },
        },
        prompts = {
          {},
        },
      },
      Bash = {
        strategy = "chat",
        description = "Ask about GNU Bash documentation",
        opts = {},
        context = {
          {
            type = "url",
            url = "https://www.gnu.org/software/bash/manual/bash.txt",
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
      "echasnovski/mini.diff",
      optional = true,
    },
    {
      "OXY2DEV/markview.nvim",
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
      opts = function(_, opts)
        autocmd("FileType", {
          pattern = "codecompanion",
          callback = function()
            vim.schedule(function()
              vim.cmd("Markview enable")
              vim.cmd("Markview hybridEnable")
            end)
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
  },
}
