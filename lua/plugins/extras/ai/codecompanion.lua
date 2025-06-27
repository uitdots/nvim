---@type NvPluginSpec
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

    vim.api.nvim_create_autocmd({ "User" }, {
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
    display = {
      chat = {
        separator = "---", -- TODO: Check this, this doesn't work
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
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "codecompanion",
          callback = function()
            vim.schedule(function()
              vim.cmd("Markview enable")
              vim.cmd("Markview hybridEnable")
            end)
          end,
        })
      end,
    },
    {
      "HakonHarnes/img-clip.nvim",
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
