---@module 'conform'

local filter_availabled_external = require("uitvim").options.filter_availabled_external

local M = {}

---@private
---@param opts conform.setupOpts
function M.filter_availabled_formatters(opts)
  for filetype, formatters in pairs(opts.formatters_by_ft) do
    ---@cast formatters string[]
    opts.formatters_by_ft[filetype] = function(bufnr)
      return vim.tbl_filter(function(formatter)
        return require("conform").get_formatter_info(formatter, bufnr).available
      end, formatters)
    end
  end
end

---@private
---@param opts conform.setupOpts
function M.extend_global_formatters(opts)
  if vim.g.conform_formatters then
    for k, v in pairs(vim.g.conform_formatters) do
      ---@diagnostic disable-next-line: param-type-mismatch due to
      opts.formatters[k] = vim.tbl_deep_extend("force", opts.formatters[k] or {}, v)
    end
  end
end

---@param opts? conform.setupOpts
function M.setup(opts)
  opts = opts or {}
  M.extend_global_formatters(opts)
  if filter_availabled_external then
    M.filter_availabled_formatters(opts)
  end
  require("conform").setup(opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
