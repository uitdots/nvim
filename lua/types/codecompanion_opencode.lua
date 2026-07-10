---@meta _

---@class CodeCompanion.OpenCode.Model.Capabilities
---@field reasoning boolean
---@field toolcall boolean
---@field attachment boolean
---@field temperature boolean

---@class CodeCompanion.OpenCode.Model.Limit
---@field context number
---@field output number

---@class CodeCompanion.OpenCode.Model.Cost
---@field input number
---@field output number

---@class CodeCompanion.OpenCode.Model.Variant
---Variant configs are provider-specific. Common shapes:
---  Anthropic:  { thinking = { type = "enabled", budgetTokens = N }, effort = "..." }
---  Anthropic:  { thinking = { type = "adaptive", display = "..." }, effort = "..." }
---  OpenAI:     { reasoningEffort = "..." }
---  DeepSeek:   { reasoningEffort = "..." }
---@field [string] any

---@class CodeCompanion.OpenCode.Model
---@field name string
---@field family string
---@field provider "anthropic"|"google"|"openai"|"openai_compatible"
---@field capabilities CodeCompanion.OpenCode.Model.Capabilities
---@field limit CodeCompanion.OpenCode.Model.Limit
---@field cost CodeCompanion.OpenCode.Model.Cost
---@field variants? table<string, CodeCompanion.OpenCode.Model.Variant>

---@class CodeCompanion.OpenCode.Models
---@field [string] CodeCompanion.OpenCode.Model
