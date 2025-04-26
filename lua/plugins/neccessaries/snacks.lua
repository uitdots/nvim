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
    -- Find
    {
      "<leader>fi",
      function()
        Snacks.picker.icons()
      end,
      desc = "Find | Icons",
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
      "<leader>nn",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Neovim | Notification History",
      silent = true,
    },
  },
}
