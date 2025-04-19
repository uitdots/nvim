---@module 'snacks'

---@type NvPluginSpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
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
    indent = {
      enabled = false,
    },
    input = {
      enabled = true,
    },
    picker = {
      enabled = true,
    },
    notifier = {
      enabled = false,
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
      "<leader>fS",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find | Smart",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find | Files",
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
      "<leader>fc",
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
    -- {
    --   "<leader>e",
    --   function()
    --     Snacks.explorer()
    --   end,
    --   desc = "Snack | File Explorer",
    -- },
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
      "<leader>fs",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Search | Visual selection or word",
      mode = { "n", "x" },
    },

    -- Git
    -- {
    --   "<leader>gb",
    --   function()
    --     Snacks.picker.git_branches()
    --   end,
    --   desc = "Git | Branches",
    -- },
    -- {
    --   "<leader>gL",
    --   function()
    --     Snacks.picker.git_log()
    --   end,
    --   desc = "Git | Log",
    -- },
    -- {
    --   "<leader>gl",
    --   function()
    --     Snacks.picker.git_log_line()
    --   end,
    --   desc = "Git | Log Line",
    -- },
    -- {
    --   "<leader>gs",
    --   function()
    --     Snacks.picker.git_status()
    --   end,
    --   desc = "Git | Status",
    -- },
    -- {
    --   "<leader>gd",
    --   function()
    --     Snacks.picker.git_diff()
    --   end,
    --   desc = "Git | Diff (Hunks)",
    -- },
    -- {
    --   "<leader>gf",
    --   function()
    --     Snacks.picker.git_log_file()
    --   end,
    --   desc = "Git | Log File",
    -- },

    -- Grep
    {
      "<leader>Sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Search | Buffer Lines",
    },
    {
      "<leader>SB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Search | Grep Open Buffers",
    },
    {
      "<leader>Sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Search | Grep",
    },

    -- search
    {
      '<leader>S"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Search | Registers",
    },
    {
      "<leader>S/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search | Search History",
    },
    {
      "<leader>Sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Search | Buffer Lines",
    },
    {
      "<leader>Sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Search | Command History",
    },
    {
      "<leader>SC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Search | Commands",
    },
    {
      "<leader>Sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Search | Diagnostics",
    },
    {
      "<leader>SD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Search | Buffer Diagnostics",
    },
    {
      "<leader>Sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Search | Help Pages",
    },
    {
      "<leader>SH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Search | Highlights",
    },
    {
      "<leader>Si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Search | Icons",
    },
    {
      "<leader>Sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Search | Jumps",
    },
    {
      "<leader>Sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Search | Keymaps",
    },
    {
      "<leader>Sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Search | Location List",
    },
    {
      "<leader>Sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Search | Marks",
    },
    {
      "<leader>SM",
      function()
        Snacks.picker.man()
      end,
      desc = "Search | Man Pages",
    },
    {
      "<leader>Sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search | Search for Plugin Spec",
    },
    {
      "<leader>Sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Search | Quickfix List",
    },
    {
      "<leader>SR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Search | Resume",
    },
    {
      "<leader>Su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Search | Undo History",
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
      desc = "Options | Dim",
    },
  },
}
