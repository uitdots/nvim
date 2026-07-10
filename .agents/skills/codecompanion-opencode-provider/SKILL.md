---
name: codecompanion-opencode-provider
description: >
  Maintain the OpenCode Zen/Go provider adapters for codecompanion.nvim.
  Use when editing opencode_adapters.lua, opencode_models.lua, or the model
  update script. Covers provider-specific parameter assembly (reasoning effort,
  thinking budgets), dynamic model fetching, and the variant system.
  Triggers: "opencode zen", "opencode go", "codecompanion opencode",
  "reasoning effort", "thinking budget", "model variants", "update_opencode_models".
---

# CodeCompanion OpenCode Provider

Maintain the OpenCode Zen and Go HTTP adapters for codecompanion.nvim. These
adapters extend `openai_compatible` and add provider-specific parameter
handling for reasoning, thinking, and variant selection.

## Source References

### Local sources (read before editing)

- **Adapter source**: `tmp/codecompanion.nvim/lua/codecompanion/adapters/http/openai_compatible.lua`
  - Base adapter we extend. Delegates all handlers to `openai.handlers.*`.
  - Key: `env.url` auto-derives `/chat/completions` and `/models` endpoints.
- **OpenAI handlers**: `tmp/codecompanion.nvim/lua/codecompanion/adapters/http/openai.lua`
  - `form_parameters` is a passthrough (returns params unchanged).
  - `reasoning_effort` schema at lines 477-505 with `enabled` function checking `can_reason`.
  - `get_default` in `schema.lua` skips fields where `enabled` returns false.
- **Schema type**: `tmp/codecompanion.nvim/lua/codecompanion/schema.lua`
  - `enabled?` — `fun(self: CodeCompanion.HTTPAdapter): boolean`
  - `validate?` — `fun(value): boolean, string?`
  - `choices` — table or `fun(self, opts?): table`
- **Our adapter**: `lua/configs/codecompanion/opencode_adapters.lua`
- **Our model table**: `lua/configs/codecompanion/opencode_models.lua` (auto-generated)
- **Model update script**: `scripts/update_opencode_models.py`
- **Plugin registration**: `lua/plugins/ai/codecompanion.lua`

### External URLs

- Zen docs: https://opencode.ai/docs/zen
- Go endpoint: https://opencode.ai/zen/go/v1/models
- Zen models API: https://opencode.ai/zen/v1/models
- GitHub discussion (working example): https://github.com/olimorris/codecompanion.nvim/discussions/3102

## Preferences

- **Env key resolution**: `OPENCODE_ZEN_API_KEY` first, fallback to `OPENCODE_API_KEY`
- **Default Zen model**: `mimo-v2.5-free`
- **Default Go model**: `mimo-v2.5`
- **Schema fields**: Use `enabled` functions to conditionally show/hide fields based on selected model
- **Variant collision**: Guard with `if params.thinkingType and not params.thinking then` to avoid variant configs being overwritten
- **Empty variants**: Return `{}` for models without variants so the picker hides
- **Type annotations**: Use `---@return CodeCompanion.HTTPAdapter` and `---@cast`
- **`vim.tbl_extend("force", ...)`** for schema merging so our fields override the base

## Architecture

```
openai_compatible (base) → openai (handlers)
       ↑
  opencode_adapters.lua (extend + override handlers/schema)
       |
       ├── opencode_zen  → https://opencode.ai/zen
       └── opencode_go   → https://opencode.ai/zen/go
```

### Provider-specific parameter shapes

| Provider | Parameters | Shape |
|----------|-----------|-------|
| **OpenAI** (gpt-5.x) | `reasoningEffort`, `reasoningSummary`, `include` | Flat |
| **Anthropic** (claude-*) | `thinking.type`, `thinking.budgetTokens`, `effort` | Nested `thinking = {}` |
| **Gemini** | `thinkingConfig.includeThoughts`, `thinkingConfig.thinkingLevel` | Nested `thinkingConfig = {}` |
| **DeepSeek/Grok/MiMo/free** | `reasoningEffort` | Flat |

### Schema fields with `enabled`

Each field uses `enabled` to check the current model's provider from the
auto-generated model table. Fields only appear when relevant:

- `variant` — visible when model has variants in the table
- `reasoningEffort` — visible when `capabilities.reasoning == true`
- `reasoningSummary` — visible when `provider == "openai"`
- `thinkingType` / `thinkingBudgetTokens` — visible when `provider == "anthropic"`
- `thinkingLevel` — visible when `provider == "google"`

**Important**: `enabled` controls UI visibility and default collection only. The
`form_parameters` handler still needs to clean up flat fields after assembly,
because:
1. Variants can set nested objects directly (e.g., `params.thinking`)
2. Users can manually edit the YAML block with hidden fields

**Completion**: Fields with `type = "enum"` get completions in the cmp source.
Always use `type = "enum"` (not `type = "string"`) for fields with `choices`.

### form_parameters flow

1. Look up model in `opencode_models` table
2. Apply variant defaults (variant sets params, explicit user params override)
3. Assemble provider-specific nested structures from flat schema fields
4. Clean up flat fields that were consumed into nested objects

## Updating models

```bash
python3 scripts/update_opencode_models.py          # regenerate (minimal: only used fields)
python3 scripts/update_opencode_models.py --all    # regenerate with all fields
python3 scripts/update_opencode_models.py --check  # CI verify
```

**Minimal mode** (default) only emits fields used by the adapter: `provider`, `capabilities.reasoning`, `variants`. This keeps the file small (609 lines vs 1284 for all fields).

**All mode** (`--all`) emits everything: `name`, `family`, `capabilities.*`, `limit`, `cost`.

## Common pitfalls

1. **Variant + thinking collision** — Always guard: `if params.thinkingType and not params.thinking then`
2. **Unknown model fallback** — `form_parameters` returns params unchanged; no warning logged
3. **OpenAI `include` param** — May not work via chat completions endpoint; verify with real call
4. **URL derivation** — `openai_compatible` appends `/chat/completions` to `env.url` automatically
5. **Schema merging** — Use `vim.tbl_extend("force", ...)` not `"keep"` to override base fields
6. **Zen gateway does NOT unify routing** — The gateway requires provider-specific endpoints:

| Model Family | Endpoint | Format |
|---|---|---|
| DeepSeek, Grok, MiniMax, GLM, Kimi, free models | `/v1/chat/completions` | OpenAI Chat Completions ✅ works |
| Claude + Qwen paid | `/v1/messages` | Anthropic Messages API ❌ 404 |
| GPT-5.x | `/v1/responses` | OpenAI Responses API ❌ wrong format |
| Gemini | `/v1/models/{model-id}` | Google Gemini API ❌ wrong format |

Our adapters extend `openai_compatible` → always sends to `/v1/chat/completions`.
This works for DeepSeek/Grok/MiniMax/GLM/Kimi/free models. **Claude/GPT-5.x/Gemini
will fail** — they need separate adapters or a routing layer (not yet implemented).
