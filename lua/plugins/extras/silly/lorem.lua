---@type LazySpec
-- NOTE: For generating Lorem
return {
  "derektata/lorem.nvim",
  enabled = true,
  cmd = "LoremIpsum",
  keys = {
    {
      "<leader>ul",
      function()
        vim.ui.select({ "words", "paragraphs" }, {
          prompt = "Select Lorem scheme",
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
      desc = "Utils | Generate Lorem",
      silent = true,
    },
  },
  ---@module 'lorem'
  ---@type LoremConfig
  opts = {
    sentenceLength = "medium",
    comma_chance = 0.2,
    max_commas_per_sentence = 2,
  },
  config = function(_, opts)
    require("lorem").opts(opts)
  end,
}
