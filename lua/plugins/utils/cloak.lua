local ft = {
  "yaml",
  "json",
  "jsonc",
  "toml",
  "env",
}

---@type NvPluginSpec
return {
  "laytan/cloak.nvim",
  keys = {
    {
      "<leader>oh",
      "<cmd>CloakToggle<cr>",
      desc = "Utils | Toggle Cloak",
      silent = true,
      ft = ft,
    },
    {
      "<leader>oH",
      "<cmd>CloakPreviewLine<cr>",
      desc = "Utils | Cloak Preview Line",
      silent = true,
      ft = ft,
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
          "*{account,credential,password,config}*.{json,jsonc,yml,yaml,toml,env}",
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
