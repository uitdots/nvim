-- TODO: May cleanup this later
local preferences_options = require("preferences").options
local g = vim.g

vim.g.base46_cache = string.format("%s/base46/", vim.fn.stdpath("data"))
g.markdown_recommended_style = 0
vim.g.health = {
  style = nil, ---@type "float" | nil
}

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

g.auto_format_enabled = preferences_options.others.auto_format_enabled
