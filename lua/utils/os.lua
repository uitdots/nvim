local sysname = vim.uv.os_uname().sysname
-- TODO: Check what does mac, and other bsd ? show?
local os = sysname:match("Windows") and "Windows" or sysname:match("Linux") and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD,...
local is_windows = os == "Windows"
local M = {}

---@type string | "Windows" | "Linux"
M.os = os

---@type boolean
M.is_windows = is_windows

M.path_delimiter = is_windows and ";" or ":"

M.path_separator = is_windows and "\\" or "/"

M.home = vim.fn.expand("$HOME")

M.ide_mode = vim.env.NVIM_NO_IDE == nil

return M
