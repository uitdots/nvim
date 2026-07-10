---@meta _

---@class CodeCompanion.OpenCode.Model.Capabilities
---@field reasoning boolean
---@field toolcall? boolean
---@field attachment? boolean
---@field temperature? boolean

---@class CodeCompanion.OpenCode.Model.Limit
---@field context? number
---@field output? number

---@class CodeCompanion.OpenCode.Model.Cost
---@field input? number
---@field output? number

---@alias CodeCompanion.OpenCode.Effort "high"|"low"|"medium"|"xhigh"|"max"
---@alias CodeCompanion.OpenCode.ReasoningEffort "high"|"low"|"medium"|"xhigh"|"max"|"minimal"|"none"
---@alias CodeCompanion.OpenCode.ThinkingType "enabled"|"adaptive"|"disabled"

--- Variant config: all fields optional, non-exact.
--- Each provider populates a different subset:
---   Anthropic enabled:  thinking = { type = "enabled", budgetTokens = N }
---   Anthropic adaptive: thinking = { type = "adaptive", ... }, effort = "high"
---   Anthropic disabled: thinking = { type = "disabled" }
---   OpenAI:             reasoningEffort = "high", reasoningSummary = "auto", include = {...}
---   OpenAI-compatible:  reasoningEffort = "high"
---   Google:             thinkingConfig = { includeThoughts = true, thinkingLevel = "high" }
---@class CodeCompanion.OpenCode.Model.VariantData
---@field thinking? { type: "enabled", budgetTokens: number } | { type: "adaptive", display?: "summarized" } | { type: "disabled" }
---@field effort? CodeCompanion.OpenCode.Effort
---@field reasoningEffort? CodeCompanion.OpenCode.ReasoningEffort
---@field reasoningSummary? "auto"|"none"|"concise"|"detailed"
---@field include? string[]
---@field thinkingConfig? { includeThoughts: boolean, thinkingLevel: string }

---@class CodeCompanion.OpenCode.Model
---@field provider "anthropic"|"google"|"openai"|"openai_compatible"
---@field name? string
---@field family? string
---@field capabilities CodeCompanion.OpenCode.Model.Capabilities
---@field limit? CodeCompanion.OpenCode.Model.Limit
---@field cost? CodeCompanion.OpenCode.Model.Cost
---@field variants? table<string, CodeCompanion.OpenCode.Model.VariantData>

---@class CodeCompanion.OpenCode.Models
---@field [string] CodeCompanion.OpenCode.Model
