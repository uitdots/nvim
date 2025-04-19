---@type NvPluginSpec
-- NOTE: For generating Lorem
return {
  "derektata/lorem.nvim",
  enabled = true,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  cmd = "LoremIpsum",
  keys = {
    {
      "<leader>ul",
      function()
        vim.ui.select({ "words", "paragraphs" }, {
          prompt = "Select Lorem scheme",
          telescope = require("telescope.themes").get_dropdown(),
        }, function(scheme)
          if not scheme then
            return
          end

          vim.ui.input({ prompt = "Enter number of " .. scheme .. "(s)" }, function(number)
            if not number then
              return
            end

            vim.cmd("LoremIpsum " .. scheme .. " " .. number)
          end)
        end)
      end,
      desc = "Lorem | Generate",
      silent = true,
    },
  },
  opts = {
    sentenceLength = "medium",
    comma_chance = 0.2,
    max_commas_per_sentence = 2,
  },
  main = "lorem",
}
