local exclude_find = {
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
}

---@type LazySpec
return {
  "folke/snacks.nvim",
  enabled = true,
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
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    animate = {
      enabled = false,
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
      refresh = "1000",
    },
    words = {
      enabled = false,
    },
    zen = {
      win = {
        backdrop = {
          transparent = true,
          blend = 0,
        },
      },
      toggles = {
        dim = false,
        git_signs = true,
        mini_diff_signs = true,
        diagnostics = true,
        inlay_hints = true,
      },
      zoom = {
        show = {
          statusline = false,
          tabline = false,
        },
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          diagnostics = false,
          inlay_hints = false,
        },
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
          exclude = exclude_find,
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
        Snacks.picker.git_branches()
      end,
      desc = "Git | Find Branches",
    },
    {
      "<leader>g<M-b>",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git | Browse",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git | Find Log",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git | Find Log Line",
    },
    {
      "<leader>g<C-s>",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git | Find Status",
    },
    {
      "<leader>g<C-d>",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git | Find Diff",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git | Find Log File",
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
    {
      "<leader>oZ",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Options | Zoom",
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
  specs = {
    {
      "neovim/nvim-lspconfig",
      dependencies = "folke/snacks.nvim",
    },
    {
      --TODO: Change to folke noice nvim later
      "noice.nvim",
      optional = true,
      dependencies = "folke/snacks.nvim",
    },
  },
}
