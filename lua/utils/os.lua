local sysname = vim.uv.os_uname().sysname
-- TODO: Check what does mac, and other bsd ? show?
local os = sysname:match("Windows") and "Windows" or sysname:match("Linux") and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD,...
local is_windows = os == "Windows"
local M = {}

---@type "Windows" | "Linux" | string
M.os = os

---@type boolean
M.is_windows = is_windows

M.path_delimiter = is_windows and ";" or ":"

M.path_separator = is_windows and "\\" or "/"

M.home = vim.fn.expand("$HOME")

return M
