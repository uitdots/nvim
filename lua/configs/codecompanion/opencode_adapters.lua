-- OpenCode Zen and Go adapters for CodeCompanion
-- Docs: https://opencode.ai/docs/zen
--
-- Model data is auto-generated: python3 scripts/update_opencode_models.py
--
-- ============================================================================
-- USAGE
-- ============================================================================
--
-- Enable the settings block in your codecompanion config:
--
--   display = { chat = { show_settings = true } }
--
-- When you open a chat, a YAML block appears at the top:
--
--   ---
--   model: mimo-v2.5-free
--   ---
--
-- Move your cursor into the block to edit values. Completion works for enum
-- fields (variant, reasoningEffort, etc.) — just start typing and cmp will
-- suggest valid options.
--
-- ============================================================================
-- WHAT EACH KEY DOES
-- ============================================================================
--
-- model (string)
--   The model to use. Populated dynamically from the /v1/models endpoint.
--   Examples: "mimo-v2.5-free", "claude-sonnet-4-5", "gpt-5.4"
--
-- variant (enum, optional)
--   A predefined configuration preset for the selected model. When set, it
--   applies multiple params at once (thinking, effort, etc.). The variant
--   picker only shows options valid for the current model.
--
--   Available variants by model type:
--
--   Anthropic (claude-*):
--     "high"    → thinking = { type = "enabled", budgetTokens = 16000 }
--     "max"     → thinking = { type = "enabled", budgetTokens = 31999 }
--
--   Anthropic adaptive (claude-fable-5, claude-opus-4-5, etc.):
--     "low"     → thinking = { type = "adaptive" }, effort = "low"
--     "medium"  → thinking = { type = "adaptive" }, effort = "medium"
--     "high"    → thinking = { type = "adaptive" }, effort = "high"
--     "xhigh"   → thinking = { type = "adaptive" }, effort = "xhigh"
--     "max"     → thinking = { type = "adaptive" }, effort = "max"
--
--   OpenAI (gpt-5.x):
--     "low"     → reasoningEffort = "low"
--     "medium"  → reasoningEffort = "medium"
--     "high"    → reasoningEffort = "high"
--
--   DeepSeek/Grok/MiMo/free:
--     "low"     → reasoningEffort = "low"
--     "medium"  → reasoningEffort = "medium"
--     "high"    → reasoningEffort = "high"
--
--   Models without variants: variant picker is hidden.
--
-- reasoningEffort (enum, optional)
--   Manually set reasoning effort (instead of using a variant).
--   Choices: "none", "minimal", "low", "medium", "high", "xhigh", "max"
--   "none" disables reasoning entirely (overrides variant defaults).
--   Only visible for models with capabilities.reasoning = true.
--
-- reasoningSummary (enum, optional)
--   Controls reasoning summary mode. Only for OpenAI models.
--   Choices: "auto", "none", "concise", "detailed"
--   Auto-set to "auto" when reasoningEffort is set (unless overridden).
--
-- thinkingType (enum, optional)
--   Anthropic thinking mode. Only for Anthropic models.
--   Choices: "enabled", "disabled", "adaptive"
--   "enabled" uses a fixed token budget (set thinkingBudgetTokens).
--   "adaptive" lets the model decide how much to think.
--
-- thinkingBudgetTokens (number, optional)
--   Token budget for Anthropic thinking when thinkingType = "enabled".
--   Common values: 16000 (high), 31999 (max).
--   Only visible for Anthropic models.
--
-- thinkingLevel (enum, optional)
--   Gemini thinking level. Only for Google models.
--   Choices: "minimal", "low", "medium", "high"
--
-- ============================================================================
-- WHAT GETS SENT TO THE API
-- ============================================================================
--
-- The YAML keys are NOT sent directly. form_parameters() transforms them:
--
--   variant        → consumed (removed from params after applying its config)
--   reasoningEffort → sent as-is for OpenAI/DeepSeek/Grok/MiMo
--                     (assembled into thinking object for Anthropic, removed)
--   reasoningSummary → sent as-is for OpenAI
--   thinkingType   → assembled into params.thinking = { type = "..." }
--                     then removed from flat params
--   thinkingBudgetTokens → assembled into params.thinking.budgetTokens
--                           then removed from flat params
--   thinkingLevel  → assembled into params.thinkingConfig = { ... }
--                     then removed from flat params
--
-- Example flow for Claude model with variant = "high":
--
--   YAML block:           { model = "claude-sonnet-4-5", variant = "high" }
--   After variant apply:  { model = "claude-sonnet-4-5", thinking = { type = "enabled", budgetTokens = 16000 } }
--   Sent to API:          { model = "claude-sonnet-4-5", thinking = { type = "enabled", budgetTokens = 16000 } }
--
-- Example flow for GPT model with variant = "high":
--
--   YAML block:           { model = "gpt-5.4", variant = "high" }
--   After variant apply:  { model = "gpt-5.4", reasoningEffort = "high" }
--   After assembly:       { model = "gpt-5.4", reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} }
--   Sent to API:          same as above
--
-- Example flow for Claude with explicit thinkingType (no variant):
--
--   YAML block:           { model = "claude-sonnet-4-5", thinkingType = "enabled", thinkingBudgetTokens = 16000 }
--   After assembly:       { model = "claude-sonnet-4-5", thinking = { type = "enabled", budgetTokens = 16000 } }
--   Sent to API:          same as above
--

local opencode_models = require("configs.codecompanion.opencode_models")

local M = {}

---Resolve API key: OPENCODE_ZEN_API_KEY first, then OPENCODE_API_KEY
---@return string|nil
local function resolve_api_key()
  return os.getenv("OPENCODE_API_KEY") or os.getenv("OPENCODE_ZEN_API_KEY")
end

---Get current model name from adapter instance
---@param self CodeCompanion.HTTPAdapter
---@return string|nil
local function get_model(self)
  local model = self.schema.model.default
  if type(model) == "function" then
    model = model()
  end
  return model
end

---Get model data from the local table
---@param self CodeCompanion.HTTPAdapter
---@return CodeCompanion.OpenCode.Model|nil
local function get_model_data(self)
  local model_name = get_model(self)
  if not model_name then
    return nil
  end
  return opencode_models[model_name]
end

---Shared schema fields for provider-specific parameters (reasoning, thinking, variants)
---Used by both Zen and Go adapters via vim.tbl_extend
---@type table<string, CodeCompanion.Schema>
local provider_schema = {
  variant = {
    order = 1,
    mapping = "parameters",
    type = "enum",
    optional = true,
    desc = "Predefined variant (low/medium/high/max/xhigh). Sets provider-specific params automatically.",
    enabled = function(self)
      local data = get_model_data(self)
      return data ~= nil and data.variants ~= nil and next(data.variants) ~= nil
    end,
    choices = function(self)
      local data = get_model_data(self)
      if data and data.variants then
        local choices = {}
        for k, _ in pairs(data.variants) do
          table.insert(choices, k)
        end
        table.sort(choices)
        return choices
      end
      return {}
    end,
  },
  reasoningEffort = {
    order = 2,
    mapping = "parameters",
    type = "enum",
    optional = true,
    desc = "Reasoning effort for reasoning models",
    enabled = function(self)
      local data = get_model_data(self)
      return data ~= nil and data.capabilities ~= nil and data.capabilities.reasoning
    end,
    choices = { "none", "minimal", "low", "medium", "high", "xhigh", "max" },
  },
  reasoningSummary = {
    order = 3,
    mapping = "parameters",
    type = "enum",
    optional = true,
    desc = "Reasoning summary mode (OpenAI models)",
    enabled = function(self)
      local data = get_model_data(self)
      return data ~= nil and data.provider == "openai"
    end,
    choices = { "auto", "none", "concise", "detailed" },
  },
  thinkingType = {
    order = 4,
    mapping = "parameters",
    type = "enum",
    optional = true,
    desc = "Thinking mode for Anthropic models",
    enabled = function(self)
      local data = get_model_data(self)
      return data ~= nil and data.provider == "anthropic"
    end,
    choices = { "enabled", "disabled", "adaptive" },
  },
  thinkingBudgetTokens = {
    order = 5,
    mapping = "parameters",
    type = "number",
    optional = true,
    desc = "Token budget for Anthropic thinking (when thinkingType=enabled)",
    enabled = function(self)
      local data = get_model_data(self)
      return data ~= nil and data.provider == "anthropic"
    end,
  },
  thinkingLevel = {
    order = 6,
    mapping = "parameters",
    type = "enum",
    optional = true,
    desc = "Thinking level for Gemini models",
    enabled = function(self)
      local data = get_model_data(self)
      return data ~= nil and data.provider == "google"
    end,
    choices = { "minimal", "low", "medium", "high" },
  },
}

---Custom form_parameters handler that assembles provider-specific nested structures
---from flat schema parameters, using the model table for provider detection
---@param self table Adapter instance
---@param params table Request parameters
---@param messages table Messages
---@return table
local function form_parameters(self, params, messages)
  local model_name = params.model
  if not model_name then
    return params
  end

  local model_data = opencode_models[model_name]
  if not model_data then
    return params
  end

  local provider = model_data.provider

  -- Apply variant if set (variant provides defaults, explicit params override)
  if params.variant and model_data.variants and model_data.variants[params.variant] then
    local var_config = model_data.variants[params.variant]
    for k, v in pairs(var_config) do
      if params[k] == nil then
        params[k] = v
      end
    end
    params.variant = nil
  elseif params.variant then
    params.variant = nil
  end

  -- Provider-specific parameter assembly
  -- After assembling flat fields into nested objects, remove the flat fields
  -- to avoid sending unrecognized parameters to the API. This is needed even
  -- though `enabled` hides fields from the UI, because:
  -- 1. Variants can set nested objects directly (e.g., params.thinking)
  -- 2. Users can manually edit the YAML block with hidden fields
  if provider == "anthropic" then
    -- Skip if variant already set params.thinking (avoids collision)
    if params.thinkingType and not params.thinking then
      params.thinking = { type = params.thinkingType }
      if params.thinkingBudgetTokens and params.thinkingType == "enabled" then
        params.thinking.budgetTokens = params.thinkingBudgetTokens
      end
    end
    params.thinkingType = nil
    params.thinkingBudgetTokens = nil
  elseif provider == "google" then
    if params.thinkingLevel then
      params.thinkingConfig = {
        includeThoughts = true,
        thinkingLevel = params.thinkingLevel,
      }
    end
    params.thinkingLevel = nil
  elseif provider == "openai" then
    if params.reasoningEffort and params.reasoningEffort ~= "none" then
      if params.reasoningSummary == nil then
        params.reasoningSummary = "auto"
      end
      if params.include == nil then
        params.include = { "reasoning.encrypted_content" }
      end
    elseif params.reasoningEffort == "none" then
      params.reasoningEffort = nil
    end
  end
  -- openai_compatible (DeepSeek, Grok, MiMo, etc.): reasoningEffort stays flat

  return params
end

---OpenCode Zen - curated models via OpenCode's AI gateway
--- NOTE: Zen gateway does NOT unify routing. This adapter sends everything to
--- /v1/chat/completions via openai_compatible. Works for: DeepSeek, Grok, MiniMax,
--- GLM, Kimi, free models. BROKEN for: Claude (/v1/messages), GPT-5.x (/v1/responses),
--- Gemini (/v1/models/{id}) — these need separate adapters or a routing layer.
---@return CodeCompanion.HTTPAdapter
function M.opencode_zen()
  local adapter = require("codecompanion.adapters").extend("openai_compatible", {
    name = "opencode_zen",
    formatted_name = "OpenCode Zen",
    env = {
      api_key = resolve_api_key,
      url = "https://opencode.ai/zen",
    },
    schema = vim.tbl_extend("force", {
      model = {
        default = "mimo-v2.5-free",
      },
    }, provider_schema),
    handlers = {
      form_parameters = form_parameters,
    },
  })
  ---@cast adapter CodeCompanion.HTTPAdapter
  return adapter
end

---OpenCode Go - lightweight models via OpenCode's Go endpoint
---@return CodeCompanion.HTTPAdapter
function M.opencode_go()
  local adapter = require("codecompanion.adapters").extend("openai_compatible", {
    name = "opencode_go",
    formatted_name = "OpenCode Go",
    env = {
      api_key = resolve_api_key,
      url = "https://opencode.ai/zen/go",
    },
    schema = vim.tbl_extend("force", {
      model = {
        default = "mimo-v2.5",
      },
    }, provider_schema),
    handlers = {
      form_parameters = form_parameters,
    },
  })
  ---@cast adapter CodeCompanion.HTTPAdapter
  return adapter
end

return M
