---@module 'snacks'

---@type NvPluginSpec
return {
  "folke/snacks.nvim",
  enabled = true,
  event = "VeryLazy",
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

    -- https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md#-examples
    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
          return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
          return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" }
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and ""
              or spinners[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinners + 1]
          end,
        })
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
    },
    indent = {
      enabled = true,
    },
    input = {
      enabled = true,
    },
    picker = {
      enabled = true,
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
    -- General
    {
      "<M-;>",
      function()
        Snacks.picker.spelling()
      end,
      desc = "General | Spelling",
    },

    -- Find
    {
      "<leader>fS",
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
            "%.egg-info/",
            "%.dart_tool/",
            "%.git/",
            "%.idea/",
            "%.next/",
            "%.venv/",
            "%.vs/",
            ".husky/_/",
            "node_modules/",
            "__pycache__/",
            "bin/",
            "build/",
            "cache/",
            "debug/",
            "dist/",
            "obj/",
          },
        })
      end,
      desc = "Find | Files",
    },
    {
      "<leader>fB",
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
      "<leader>fW",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Find | Visual Selection or Word",
      mode = { "n", "x" },
    },
    {
      "<leader>fb",
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
      "<leader>gb",
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
  },
}
