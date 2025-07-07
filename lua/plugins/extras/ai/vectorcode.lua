---@type LazySpec
return {
  "Davidyz/VectorCode",
  enabled = false,
  version = "*",
  -- build = "uv tool upgrade 'vectorcode[lsp]'",
  build = "uv tool upgrade vectorcode",
  ---@module 'vectorcode'
  ---@type VectorCode.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    async_backend = "default",
  },
  dependencies = "nvim-lua/plenary.nvim",
  specs = {
    {
      "olimorris/codecompanion.nvim",
      opts = {
        extensions = {
          vectorcode = {
            opts = {
              add_tool = true,
              add_slash_command = true,
            },
            ---@module 'vectorcode'
            ---@type VectorCode.CodeCompanion.ToolOpts
            tool_opts = nil,
          },
        },
      },
      dependencies = "Davidyz/VectorCode",
      optional = true,
    },
  },
}
