---@type LazySpec
---NOTE: Don't early load this. Use syntax highlight, ft detection from ansible-vim already
return {
  "mfussenegger/nvim-ansible",
  ft = "yaml.ansible",
  keys = {
    {
      "<localleader>a",
      function()
        require("ansible").run()
      end,
      desc = "Local | Run Ansible",
      silent = true,
    },
    {
      "<localleader>a",
      function()
        vim.cmd("w")
        require("ansible").run()
      end,
      desc = "Local | Run Ansible",
      silent = true,
      mode = "v",
    },
  },
}
