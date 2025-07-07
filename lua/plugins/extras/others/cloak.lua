local ft = {
  "yaml",
  "json",
  "jsonc",
  "toml",
  "env",
  "dotenv",
}

---@type LazySpec
return {
  "laytan/cloak.nvim",
  keys = {
    {
      "<leader>oH",
      "<cmd>CloakToggle<cr>",
      desc = "Options | Toggle Cloak",
      silent = true,
    },
    {
      "<leader>oh",
      "<cmd>CloakPreviewLine<cr>",
      desc = "Options | Cloak Preview Line",
      silent = true,
    },
  },
  ft = ft,
  cmd = {
    "CloakToggle",
    "CloakEnable",
    "CloakDisable",
    "CloakPreviewLine",
  },
  opts = {
    cloak_length = "5",
    patterns = {
      {
        file_pattern = {
          ".env*",
          "*{account,credential,password}*.{json,jsonc,yml,yaml,toml,env}",
        },
        cloak_pattern = {
          "=.+",
          "-.+",
          ":.+",
        },
      },
    },
  },
}
