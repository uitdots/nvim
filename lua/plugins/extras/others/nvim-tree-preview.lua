local map = vim.keymap.set

---@type LazySpec
return {
  "b0o/nvim-tree-preview.lua",
  ---@module 'nvim-tree-preview'
  ---@type PreviewConfigSetup
  ---@diagnostic disable-next-line: missing-fields
  opts = {},
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function(args)
        vim.schedule(function()
          map("n", "P", function()
            require("nvim-tree-preview").watch()
          end, { desc = "NvimTreePreview | Preview (Watch)", buffer = args.buf })
          map("n", "<Esc>", function()
            require("nvim-tree-preview").unwatch()
          end, { desc = "NvimTreePreview | Close Preview/Unwatch", buffer = args.buf })
          map("n", "<Tab>", function()
            local api = require("nvim-tree.api")
            local ok, node = pcall(api.tree.get_node_under_cursor)
            if ok and node then
              if node.type == "directory" then
                api.node.open.edit()
              else
                require("nvim-tree-preview").node(node, { toggle_focus = true })
              end
            end
          end, { desc = "NvimTreePreview | Preview", buffer = args.buf })
        end)
      end,
    })
  end,
}
