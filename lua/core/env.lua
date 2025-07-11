local path_delimiter = require("utils.os").path_delimiter
local path_separator = require("utils.os").path_separator

vim.env.PATH = (table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, path_separator)) .. (path_delimiter .. table.concat({ vim.fn.stdpath("data"), "lazy-rocks", "hererocks", "bin" }, path_separator)) .. (path_delimiter .. vim.env.PATH)
