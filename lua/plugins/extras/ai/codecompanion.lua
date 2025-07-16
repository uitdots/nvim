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
      desc = "AI | Actions",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "AI | Add Current to Chat",
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
      desc = "AI | Toggle Chat",
      mode = "n",
      silent = true,
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<CR>",
      desc = "AI | Inline Chat",
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
  end,
  opts = {
    strategies = {
      chat = {
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
        references = {
          {
            type = "url",
            url = "https://raw.githubusercontent.com/casey/just/refs/heads/master/README.md",
          },
        },
        prompts = {
          {
            role = "user",
            content = "",
            opts = {
              auto_submit = false,
            },
          },
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
  },
}
