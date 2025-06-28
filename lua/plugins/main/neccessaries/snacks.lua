---@module 'snacks'

---@type NvPluginSpec
return {
  "folke/snacks.nvim",
  enabled = true,
  lazy = false, -- Because we use in lspconfig (global Snacks so we shouldn't lazy it)
  init = function()
    -- https://github.com/folke/snacks.nvim/blob/main/docs/rename.md#nvim-tree
    local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeSetup",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            Snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })

    -- https://github.com/folke/snacks.nvim/blob/main/docs/rename.md#oilnvim
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if event.data.actions.type == "move" then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })
  end,
  ---@type snacks.Config
  opts = {
    animate = {
      enabled = true,
    },
    bigfile = {
      enabled = true,
    },
    dashboard = {
      enabled = false,
    },
    dim = {
      enabled = true,
    },
    explorer = {
      enabled = false,
    },
    image = {
      enabled = true,
      doc = {
        enabled = false,
      },
    },
    indent = {
      enabled = true,
    },
    input = {
      enabled = true,
    },
    picker = {
      enabled = true,
      layout = {
        layout = {
          backdrop = false,
        },
      },
    },
    notifier = {
      enabled = true,
    },
    quickfile = {
      enabled = false,
    },
    scope = {
      enabled = false,
    },
    scroll = {
      enabled = false,
    },
    statuscolumn = {
      enabled = true,
      folds = {
        open = true,
      },
    },
    words = {
      enabled = true,
    },
    zen = {
      toggles = {
        dim = true,
        git_signs = false,
        mini_diff_signs = false,
        diagnostics = true,
        inlay_hints = true,
      },
    },
  },
  keys = {
    -- Find
    {
      "<leader>fs",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Find | Visual Selection or Word",
      mode = { "n", "x" },
    },
    {
      "<leader>fS",
      function()
        Snacks.picker.spelling()
      end,
      desc = "Find | Spelling",
    },
    {
      "<leader>f<C-s>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find | Smart",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.files({
          hidden = true,
          ignored = true,
          exclude = {
            "%.dart_tool/",
            "%.egg-info/",
            "%.git/",
            "%.gradle/",
            "%.idea/",
            "%.next/",
            "%.venv/",
            "%.vs/",
            ".husky/_/",
            "__pycache__/",
            "bin/",
            "build/",
            "cache/",
            "debug/",
            "dist/",
            "node_modules/",
            "obj/",
          },
        })
      end,
      desc = "General | Find Files",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({
          hidden = true,
          ignored = true,
        })
      end,
      desc = "Find | All Files",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find | Buffers",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find | Words",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Find | Command History",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Find | Notification History",
    },
    {
      "<leader>fa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Find | Autocommands",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find | Git Files",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Find | Recent",
    },
    {
      "<leader>fR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Find | Resume",
    },
    {
      "<leader>fB",
      function()
        Snacks.picker.lines()
      end,
      desc = "Find | Buffer Lines",
    },
    {
      '<leader>f"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Find | Registers",
    },
    {
      "<leader>f/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Find | Search History",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Find | Commands",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Find | Help Pages",
    },
    {
      "<leader>fH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Find | Highlights",
    },
    {
      "<leader>fi",
      function()
        Snacks.picker.icons()
      end,
      desc = "Find | Icons",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Find | Keymaps",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Find | Location List",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Find | Marks",
    },
    {
      "<leader>fM",
      function()
        Snacks.picker.man()
      end,
      desc = "Find | Man Pages",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Find | Plugin Spec",
    },
    {
      "<leader>fq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Find | Quickfix List",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Find | Undo History",
    },

    -- Git
    {
      "<leader>g<C-b>",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git | Browse",
    },
    {
      "<leader>gB",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git | Branches",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git | Log",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git | Log Line",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git | Status",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git | Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git | Log File",
    },

    -- Options
    {
      "<leader>od",
      function()
        if Snacks.dim.enabled then
          Snacks.dim.disable()
        else
          Snacks.dim.enable()
        end
      end,
      desc = "Options | Dim",
    },
    {
      "<leader>oz",
      function()
        Snacks.zen()
      end,
      desc = "Options | Zen",
    },

    -- Neovim
    {
      "<leader>nN",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Neovim | Notification History",
      silent = true,
    },
    {
      "<leader>nn",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Neovim | Hide Notification",
      silent = true,
    },
    {
      "<leader>ni",
      function()
        Snacks.image.hover()
      end,
      desc = "Neovim | Show Current Image",
      silent = true,
    },
  },
}
