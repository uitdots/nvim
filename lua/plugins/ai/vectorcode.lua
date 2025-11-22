local is_executable = require("utils.executable").is_executable

---@type LazySpec
return {
  "Davidyz/VectorCode",
  version = "*",
  enabled = is_executable("vectorcode"),
  build = "uv tool upgrade vectorcode",
  ---@module 'vectorcode'
  ---@type VectorCode.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    async_backend = "lsp",
  },
  dependencies = "nvim-lua/plenary.nvim",
  specs = {
    {
      "olimorris/codecompanion.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          extensions = {
            vectorcode = {
              ---@module 'vectorcode'
              ---@type VectorCode.CodeCompanion.ExtensionOpts
              opts = {
                add_tool = true,
                add_slash_command = true,
              },
              ---@type VectorCode.CodeCompanion.ToolOpts
              tool_opts = nil,
            },
          },
        })
      end,
      dependencies = "Davidyz/VectorCode",
      optional = true,
    },
  },
}
