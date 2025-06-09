local map = vim.keymap.set

---@type NvPluginSpec
return {
  {
    "b0o/nvim-tree-preview.lua",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts = opts or {}
      local origin_on_attach = opts.on_attach ---@type function | nil

      opts.on_attach = function(bufnr)
        if origin_on_attach ~= nil then
          origin_on_attach(bufnr)
        end

        local api = require("nvim-tree.api")
        local preview = require("nvim-tree-preview")

        local function keymap_opts(desc)
          return { desc = "NvimTree | " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        map("n", "l", api.node.open.edit, keymap_opts("Open"))
        map("n", "u", api.tree.change_root_to_parent, keymap_opts("Up"))
        -- NOTE: Config for "b0o/nvim-tree-preview.lua"
        map("n", "P", preview.watch, keymap_opts("Preview (Watch)"))
        map("n", "<Esc>", preview.unwatch, keymap_opts("Close Preview/Unwatch"))
        map("n", "<Tab>", function()
          local ok, node = pcall(api.tree.get_node_under_cursor)
          if ok and node then
            if node.type == "directory" then
              api.node.open.edit()
            else
              preview.node(node, { toggle_focus = true })
            end
          end
        end, keymap_opts("Preview"))
      end
    end,
  },
}
