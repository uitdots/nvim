---
name: opencode-adapter
description: >
  Create and maintain custom OpenCode adapters for codecompanion.nvim.
  Use this skill when building HTTP adapters that extend openai_compatible,
  implementing provider-specific parameter handling (reasoning effort, thinking budgets),
  generating model tables from opencode CLI output, or debugging adapter parameter flow.
  Triggers: "codecompanion adapter", "opencode zen", "opencode go", "custom adapter",
  "reasoning effort adapter", "model table generation", "openai_compatible extend".
---

# OpenCode Adapter for CodeCompanion

Build custom HTTP adapters for codecompanion.nvim that connect to OpenCode's Zen and Go endpoints.

## Architecture

```
codecompanion.nvim adapter chain:
  openai_compatible (base) → openai (handlers)
       ↑
  your adapter (extend + override handlers/schema)
```

**Key insight**: `openai_compatible` delegates ALL handlers to `openai`. When you `extend("openai_compatible", overrides)`, your schema fields with `mapping = "parameters"` flow through the passthrough `form_parameters` handler directly into the API request body.

## Quick Start

### Minimal adapter

```lua
-- lua/configs/codecompanion/my_adapter.lua
local M = {}

---@return CodeCompanion.HTTPAdapter
function M.my_adapter()
  local adapter = require("codecompanion.adapters").extend("openai_compatible", {
    name = "my_adapter",
    formatted_name = "My Adapter",
    env = {
      api_key = "MY_API_KEY",        -- env var name (string)
      -- OR function for fallback logic:
      -- api_key = function() return os.getenv("X") or os.getenv("Y") end,
      url = "https://api.example.com",  -- base URL, /v1/chat/completions appended
    },
    schema = {
      model = { default = "default-model" },
      -- Add your custom parameters here
    },
  })
  return adapter
end

return M
```

### Register in codecompanion config

```lua
-- lua/plugins/ai/codecompanion.lua
return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      http = {
        my_adapter = function()
          return require("configs.codecompanion.my_adapter").my_adapter()
        end,
      },
    },
    interactions = {
      chat = { adapter = "my_adapter" },
      inline = { adapter = "my_adapter" },
    },
  },
}
```

## Provider-Specific Parameter Handling

Different model families use different parameter shapes for reasoning/thinking control. The `form_parameters` handler assembles provider-specific nested structures from flat schema fields.

### Parameter mapping by provider

| Provider | Parameters | Shape |
|----------|-----------|-------|
| **OpenAI** (gpt-5.x) | `reasoningEffort`, `reasoningSummary`, `include` | Flat |
| **Anthropic** (claude-*) | `thinking.type`, `thinking.budgetTokens`, `effort` | Nested `thinking = {}` |
| **Gemini** | `thinkingConfig.includeThoughts`, `thinkingConfig.thinkingLevel` | Nested `thinkingConfig = {}` |
| **DeepSeek/Grok/MiMo** | `reasoningEffort` | Flat |

### Schema fields pattern

Define flat fields with `mapping = "parameters"`, then assemble nested structures in `form_parameters`:

```lua
local reasoning_schema = {
  variant = {
    order = 1,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Predefined variant (low/medium/high/max)",
    choices = function(self)
      -- Dynamic choices based on selected model
      local model_name = self.schema.model.default
      if type(model_name) == "function" then model_name = model_name() end
      local models = require("configs.codecompanion.opencode_models")
      local model_data = models[model_name]
      if model_data and model_data.variants then
        local choices = {}
        for k, _ in pairs(model_data.variants) do
          table.insert(choices, k)
        end
        table.sort(choices)
        return choices
      end
      return {}  -- Empty = hide picker for models without variants
    end,
  },
  reasoningEffort = {
    order = 2,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Reasoning effort (OpenAI, DeepSeek, Grok, MiMo)",
    choices = { "none", "minimal", "low", "medium", "high", "xhigh", "max" },
  },
  thinkingType = {
    order = 4,
    mapping = "parameters",
    type = "string",
    optional = true,
    desc = "Thinking mode for Anthropic models",
    choices = { "enabled", "disabled", "adaptive" },
  },
  thinkingBudgetTokens = {
    order = 5,
    mapping = "parameters",
    type = "number",
    optional = true,
    desc = "Token budget for Anthropic thinking",
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
```

### form_parameters handler

Override the handler to assemble nested structures and apply variants:

```lua
local function form_parameters(self, params, messages)
  local model_name = params.model
  if not model_name then return params end

  local model_data = opencode_models[model_name]
  if not model_data then return params end

  -- Apply variant (variant provides defaults, explicit params override)
  if params.variant and model_data.variants and model_data.variants[params.variant] then
    local var_config = model_data.variants[params.variant]
    for k, v in pairs(var_config) do
      if params[k] == nil then params[k] = v end
    end
    params.variant = nil
  elseif params.variant then
    params.variant = nil
  end

  -- Provider-specific assembly
  local provider = model_data.provider

  if provider == "anthropic" then
    -- Guard: skip if variant already set params.thinking
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
      if params.reasoningSummary == nil then params.reasoningSummary = "auto" end
      if params.include == nil then params.include = { "reasoning.encrypted_content" } end
    elseif params.reasoningEffort == "none" then
      params.reasoningEffort = nil
    end
  end
  -- openai_compatible: reasoningEffort stays flat

  return params
end
```

## Model Table Generation

Auto-generate a Lua model table from `opencode models --verbose` for provider detection and variant configs.

### Python script pattern

```python
#!/usr/bin/env python3
"""Generate model table from opencode CLI."""
import subprocess, json, sys, os

def detect_provider(npm: str) -> str:
    """Detect provider from npm package name."""
    npm_lower = npm.lower()
    if "anthropic" in npm_lower: return "anthropic"
    if "google" in npm_lower: return "google"
    if "openai" in npm_lower: return "openai"
    return "openai_compatible"

def parse_models(raw: str) -> dict:
    """Parse opencode models --verbose output."""
    models = {}
    lines = raw.split("\n")
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if line == "{":
            json_lines = [line]
            brace_count = 1
            i += 1
            while i < len(lines) and brace_count > 0:
                l = lines[i].strip()
                json_lines.append(l)
                brace_count += l.count("{") - l.count("}")
                i += 1
            try:
                model = json.loads("\n".join(json_lines))
                if model.get("providerID") == "opencode":
                    models[model["id"]] = model
            except json.JSONDecodeError:
                pass
        else:
            i += 1
    return models
```

### Generated Lua table structure

```lua
return {
  ["model-id"] = {
    name = "Display Name",
    family = "model-family",
    provider = "anthropic",  -- detected from api.npm
    capabilities = {
      reasoning = true,
      toolcall = true,
      attachment = true,
      temperature = true,
    },
    limit = { context = 200000, output = 64000 },
    cost = { input = 3, output = 15 },
    variants = {
      ["high"] = { thinking = { type = "adaptive" }, effort = "high" },
      ["low"] = { reasoningEffort = "low" },
    },
  },
}
```

## Common Pitfalls

1. **`vim.tbl_extend("force", ...)` for schema merging** — Use `"force"` not `"keep"`, so your schema fields override the base
2. **Variant collision** — When a variant sets `params.thinking` and user also sets `thinkingType`, the handler overwrites the variant. Guard with `if params.thinkingType and not params.thinking then`
3. **Empty variant choices** — Return `{}` (not hardcoded values) for models without variants, so the picker hides
4. **`env.url` auto-derives endpoints** — `openai_compatible` appends `/chat/completions` and `/models` to the base URL automatically
5. **`params.model` availability** — The model is set in `params` before `form_parameters` is called, so `params.model` is reliable

## Updating Models

```bash
python3 scripts/update_opencode_models.py          # regenerate table
python3 scripts/update_opencode_models.py --check   # CI: verify up-to-date
```
