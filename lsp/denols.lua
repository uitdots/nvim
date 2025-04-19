local util = require("lspconfig.util")

local deno_matcher = function(path)
  local patterns = { "deno.json", "deno.jsonc" }
  for _, pattern in ipairs(patterns) do
    local f = vim.fn.glob(table.concat({ path, pattern }, "/"))
    if f ~= "" then
      return path
    end
  end
end

return {
  root_dir = function(fname)
    return util.search_ancestors(fname, deno_matcher)
  end,
}
