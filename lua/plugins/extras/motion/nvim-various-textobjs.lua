---@type LazySpec
return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",
  opts = {
    keymaps = {
      useDefaults = true,
      disabledDefaults = {
        "restOfIndentation",
        "restOfParagraph",
      },
    },
  },
  keys = {
    {
      "gx",
      function()
        require("various-textobjs").url()
        local foundURL = vim.fn.mode() == "v"
        if not foundURL then
          return
        end
        local url = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { type = "v" })[1]
        vim.ui.open(url)
        vim.cmd.normal({ "v", bang = true })
      end,
      desc = "Various Textobjs | Smart URL Opener",
      silent = true,
    },
    {
      "gf",
      function()
        require("various-textobjs").filepath("outer")
        local foundPath = vim.fn.mode() == "v"
        if not foundPath then
          return
        end
        local path = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { type = "v" })[1]
        local exists = vim.uv.fs_stat(vim.fs.normalize(path)) ~= nil
        if exists then
          vim.ui.open(path)
        else
          vim.notify("Path does not exist.", vim.log.levels.WARN, { title = "Open File", id = "open_file" })
        end
      end,
      desc = "Various Textobjs | Smart File Opener",
      silent = true,
    },
  },
}
