---@type LazySpec
return {
  "nvzone/menu",
  enabled = true,
  keys = {
    {
      "<RightMouse>",
      function()
        require("menu.utils").delete_old_menus()
        vim.cmd.exec('"normal! \\<RightMouse>"')
        local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
        local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
        require("menu").open(options, { mouse = true })
      end,
      desc = "General | NvZone Menu",
      mode = { "n", "v" },
    },
    {
      "<M-t>",
      function()
        require("menu").open("default")
      end,
      desc = "General | NvZone Menu",
    },
  },
  config = function()
    local default_menu = require("menus.default")

    vim.list_extend(default_menu, {
      {
        name = "  Inspect",
        cmd = "Inspect",
      },
    })
  end,
  dependencies = "nvzone/volt",
}
