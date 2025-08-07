---@meta _

---@class (exact) Preferences
---@field lsp Preferences.Lsp
---@field options Preferences.Options Options for configuration

---@class (exact) Preferences.Lsp
---External LSPs to setup
---@field force Lsp[]
---Exclude those LSPs (from Mason auto setup)
---@field exclude Lsp[]

---@class (exact) Preferences.Options
---@field indent Preferences.Options.Indent
---@field wrap Preferences.Options.Wrap
---@field inlay_hint Preferences.Options.InlayHint
---@field semantic_tokens Preferences.Options.SemanticTokens
---@field others Preferences.Options.Others

-- FIXME: It's quite bruh here, how about tab instead of space (noexpandtab)
--
---@class (exact) Preferences.Options.Indent
---@field default number
---Values are filetypes
---@field space table<number, string[]>
---Values are filetypes
---@field tab table<number, string[]>

---@class (exact) Preferences.Options.Wrap
---@field default boolean
---Filetypes to revert to default wrap setting
---@field revert string[]

---@class (exact) Preferences.Options.InlayHint
---Fallback for language servers not declared in "servers"
---@field server_default boolean
---Enable inlay hints for specific servers
---@field servers boolean | table<string, boolean>
---Enable inlay hints for Neovim client
---@field client boolean

---@class (exact) Preferences.Options.SemanticTokens
---Fallback for language servers not declared in "servers"
---@field server_default boolean
---Enable semantic tokens for specific servers
---@field servers table<string, boolean>
---Enable semantic tokens for Neovim
---@field client boolean

---@class (exact) Preferences.Options.Others
---@field auto_format_enabled boolean
---Enable AI Suggestion on typing by default
---@field ai_suggestion_enabled boolean
---Filter out the lsps, linters, formatters,... (if it can)
---@field filter_availabled_external boolean
