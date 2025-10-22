---@type table<string, true>
local disable_fts = {
  codecompanion = true,
  help = true,
  [""] = true,
}

---@type LazySpec
return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  ---@module 'dropbar'
  ---@type dropbar_configs_t
  opts = {
    -- TODO: Maybe filter for java kotlin
    sources = {
      path = {
        -- max_depth = 16,
      },
    },
    bar = {
      ---This is taken from default and just to exclude codecompanion filetype
      ---@param buf integer?
      ---@param win integer?
      enable = function(buf, win)
        if (buf ~= nil and not vim.api.nvim_buf_is_valid(buf)) or (win ~= nil and not vim.api.nvim_win_is_valid(win)) or vim.fn.win_gettype(win) ~= "" or vim.wo[win].winbar ~= "" or disable_fts[vim.bo[buf].filetype] then
          return false
        end

        if buf ~= nil then
          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
          if stat and stat.size > 1024 * 1024 then
            return false
          end
        end

        return vim.bo[buf].ft == "markdown" or pcall(vim.treesitter.get_parser, buf) or not vim.tbl_isempty(vim.lsp.get_clients({
          bufnr = buf,
          method = vim.lsp.protocol.Methods.textDocument_documentSymbol,
        }))
      end,
      truncate = true,
    },
  },
  -- optional, but required for fuzzy finder support
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      optional = true,
    },
  },
}
