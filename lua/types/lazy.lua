---@diagnostic disable: duplicate-doc-field, duplicate-doc-alias

---@meta _

---@class LazyPluginHooks
---@field opts_extend? string[]

---Override from this https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/handler/event.lua
---@alias _LazyEvent string|"VeryLazy"|vim.VimEvent
---@alias LazyEventSpec _LazyEvent|{event?:_LazyEvent|_LazyEvent[], pattern?:string|string[]}|_LazyEvent[]

---@class LazyPluginSpecHandlers
---@field event? _LazyEvent[]|_LazyEvent|LazyEventSpec[]|fun(self:LazyPlugin, event:_LazyEvent[]):_LazyEvent[]

---Override from this https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/handler/keys.lua
---@class LazyKeys
---@field silent boolean?
