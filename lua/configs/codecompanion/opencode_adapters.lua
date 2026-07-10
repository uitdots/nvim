-- OpenCode Zen and Go adapters for CodeCompanion
-- Docs: https://opencode.ai/docs/zen
--
-- Model data is auto-generated: python3 scripts/update_opencode_models.py

local opencode_models = require("configs.codecompanion.opencode_models")

local M = {}

---Resolve API key: OPENCODE_ZEN_API_KEY first, then OPENCODE_API_KEY
---@return string|nil
local function resolve_api_key()
  return os.getenv("OPENCODE_ZEN_API_KEY") or os.getenv("OPENCODE_API_KEY")
end

---Shared schema fields for reasoning/thinking control
---@type table<string, CodeCompanion.Schema>
local reasoning_schema = {
  variant = {
    order = 1,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Predefined variant (low/medium/high/max/xhigh). Sets provider-specific params automatically.",
    ---@param self table
    ---@return table
    choices = function(self)
      local model_name = self.schema.model.default
      if type(model_name) == "function" then
        model_name = model_name()
      end
      local model_data = opencode_models[model_name]
      if model_data and model_data.variants then
        local choices = {}
        for k, _ in pairs(model_data.variants) do
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
    type = "string",
    optional = true,
    desc = "Reasoning effort (OpenAI, DeepSeek, Grok, MiMo, free models)",
    choices = { "none", "minimal", "low", "medium", "high", "xhigh", "max" },
  },
  reasoningSummary = {
    order = 3,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Reasoning summary mode (OpenAI models)",
    choices = { "auto", "none", "concise", "detailed" },
  },
  thinkingType = {
    order = 4,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Thinking mode for Anthropic models (enabled/disabled/adaptive)",
    choices = { "enabled", "disabled", "adaptive" },
  },
  thinkingBudgetTokens = {
    order = 5,
    mapping = "parameters",
    type = "number",
    optional = true,
    desc = "Token budget for Anthropic thinking (when thinkingType=enabled)",
  },
  thinkingLevel = {
    order = 6,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Thinking level for Gemini models",
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
    -- Unknown variant for this model, just remove it
    params.variant = nil
  end

  -- Provider-specific parameter assembly
  if provider == "anthropic" then
    -- Anthropic: assemble thinking object from flat fields
    -- Skip if variant already set params.thinking (avoids collision)
    if params.thinkingType and not params.thinking then
      params.thinking = { type = params.thinkingType }
      if params.thinkingBudgetTokens and params.thinkingType == "enabled" then
        params.thinking.budgetTokens = params.thinkingBudgetTokens
      end
      params.thinkingType = nil
      params.thinkingBudgetTokens = nil
    else
      params.thinkingType = nil
      params.thinkingBudgetTokens = nil
    end
    -- effort is a top-level param for some Claude models
    if params.effort then
      -- already correct, keep it
    end
  elseif provider == "google" then
    -- Gemini: assemble thinkingConfig from flat field
    if params.thinkingLevel then
      params.thinkingConfig = {
        includeThoughts = true,
        thinkingLevel = params.thinkingLevel,
      }
      params.thinkingLevel = nil
    end
  elseif provider == "openai" then
    -- OpenAI: reasoningEffort is flat, add reasoningSummary if reasoning is used
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
    }, reasoning_schema),
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
    }, reasoning_schema),
    handlers = {
      form_parameters = form_parameters,
    },
  })
  ---@cast adapter CodeCompanion.HTTPAdapter
  return adapter
end

return M
