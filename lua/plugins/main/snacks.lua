local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local exclude_lsps = require("configs.lsp.autocmds").exclude_lsps

local exclude_find = {
  "%.dart_tool/",
  "%.direnv/",
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
  event = "VeryLazy",
  lazy = vim.fn.argc(-1) == 0,
  init = function()
    -- https://github.com/folke/snacks.nvim/blob/main/docs/rename.md#nvim-tree
    local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
    autocmd("User", {
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
    autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if event.data.actions.type == "move" then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })

    autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or exclude_lsps[client.name] then
          return
        end

        map("n", "gD", Snacks.picker.lsp_declarations, { desc = "LSP | Go to Declarations", buffer = bufnr })
        map("n", "gd", Snacks.picker.lsp_definitions, { desc = "LSP | Go to Definition", buffer = bufnr })
        map("n", "grS", Snacks.picker.lsp_workspace_symbols, { desc = "LSP | Workspace Symbols", buffer = bufnr })
        map("n", "gri", Snacks.picker.lsp_implementations, { desc = "LSP | Go to Implementations", buffer = bufnr })
        map("n", "grr", Snacks.picker.lsp_references, { desc = "LSP | Go to references", buffer = bufnr })
        map("n", "gO", Snacks.picker.lsp_symbols, { desc = "LSP | Symbols", buffer = bufnr })
        map("n", "grt", Snacks.picker.lsp_type_definitions, { desc = "LSP | Go to Type Definition", buffer = bufnr })
        map("n", "gro", Snacks.picker.lsp_outgoing_calls, { desc = "LSP | Outgoing Calls", buffer = bufnr })
        map("n", "gri", Snacks.picker.lsp_incoming_calls, { desc = "LSP | Incomming Calls", buffer = bufnr })
      end,
    })
  end,
  ---@type snacks.Config
  opts = {
    animate = {
      fps = 60,
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
      enabled = false,
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
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
    notifier = {
      enabled = true,
      top_down = false,
    },
    quickfile = {
      enabled = false,
    },
    scope = {
      enabled = false,
    },
    scroll = {
      enabled = true,
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
        mini_diff_signs = false,
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
        Snacks.picker.grep_word({
          layout = {
            preset = "dropdown",
          },
        })
      end,
      desc = "Snacks | Grep String",
      mode = { "n", "x" },
    },
    {
      "<leader>fS",
      function()
        Snacks.picker.spelling()
      end,
      desc = "Snacks | Spelling",
    },
    {
      "<leader>f<C-s>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Snacks | Smart",
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
      desc = "Snacks | Find Files",
    },
    {
      "<leader>fa",
      function()
        Snacks.picker.files({
          hidden = true,
          ignored = true,
        })
      end,
      desc = "Snacks | All Files",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Snacks | Buffers",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep({
          layout = {
            preset = "dropdown",
          },
        })
      end,
      desc = "Snacks | Words",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Snacks | Command History",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Snacks | Notification History",
    },
    {
      "<leader>fA",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Snacks | Autocommands",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Snacks | Git Files",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Snacks | Recent",
    },
    {
      "<leader>fR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Snacks | Resume",
    },
    {
      "<leader>f/",
      function()
        Snacks.picker.lines()
      end,
      desc = "Snacks | Buffer Lines",
    },
    {
      '<leader>f"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Snacks | Registers",
    },
    {
      "<leader>f?",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Snacks | Search History",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Snacks | Commands",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Snacks | Help Pages",
    },
    {
      "<leader>fH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Snacks | Highlights",
    },
    {
      "<leader>fi",
      function()
        Snacks.picker.icons()
      end,
      desc = "Snacks | Icons",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Snacks | Keymaps",
    },
    {
      "<leader>f<C-t>",
      function()
        Snacks.picker.tags()
      end,
      desc = "Snacks | Tags",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Snacks | Location List",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Snacks | Marks",
    },
    {
      "<leader>fM",
      function()
        Snacks.picker.man()
      end,
      desc = "Snacks | Man Pages",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Snacks | Plugin Spec",
    },
    {
      "<leader>fq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Snacks | Quickfix List",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Snacks | Undo History",
    },

    -- Git
    {
      "<leader>g<C-b>",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Snacks | Find Branches",
    },
    {
      "<leader>g<M-b>",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Snacks | Browse",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Snacks | Find Log",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Snacks | Find Log Line",
    },
    {
      "<leader>g<C-s>",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Snacks | Find Status",
    },
    {
      "<leader>g<C-d>",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Snacks | Find Diff",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Snacks | Find Log File",
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
      desc = "Snacks | Dim",
    },
    {
      "<leader>oz",
      function()
        Snacks.zen()
      end,
      desc = "Snacks | Zen",
    },
    {
      "<leader>oZ",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Snacks | Zoom",
    },

    -- Neovim
    {
      "<leader>nN",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Snack | Notification History",
      silent = true,
    },
    {
      "<leader>nn",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Snack | Hide Notification",
      silent = true,
    },
    {
      "<leader>uI",
      function()
        Snacks.image.hover()
      end,
      desc = "Snack | Show Current Image",
      silent = true,
    },
    -- Bufdelete
    {
      "<leader>c",
      function()
        Snacks.bufdelete.delete()
      end,
      desc = "Snacks | Close Buffer",
      silent = true,
    },
    {
      "<leader>C",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Snacks | Close Other Buffers",
      silent = true,
    },
    {
      "<leader><M-c>",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Snacks | Close Buffers",
      silent = true,
    },
  },
  specs = {
    {
      "folke/noice.nvim",
      optional = true,
      dependencies = "folke/snacks.nvim",
    },
  },
}
