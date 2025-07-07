---@diagnostic disable: duplicate-doc-field, duplicate-doc-alias

---@meta lazy
---@module 'lazy'

---@class LazyPluginHooks
---@field opts_extend? string[]

---Override from this https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/handler/event.lua
---@alias LazyEventSpec vim.Event|{event?:vim.Event|vim.Event[], pattern?:string|string[]}|vim.Event[]

---@class LazyPluginSpecHandlers
---@field event? vim.Event[]|vim.Event|LazyEventSpec[]|fun(self:LazyPlugin, event:vim.Event[]):vim.Event[]
