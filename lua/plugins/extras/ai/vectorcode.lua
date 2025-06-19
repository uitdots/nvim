---@type NvPluginSpec
return {
  {
    "Davidyz/VectorCode",
    version = "*",
    build = "uv tool upgrade 'vectorcode[lsp]'",
    ---@module 'vectorcode'
    ---@type VectorCode.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      async_backend = "lsp",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
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
    dependencies = {
      "Davidyz/VectorCode",
    },
    optional = true,
  },
}
