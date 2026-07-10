-- Auto-generated from `opencode models --verbose`
-- Do not edit manually.
-- Update: python3 scripts/update_opencode_models.py

---@type CodeCompanion.OpenCode.Models
local M = {}

M["big-pickle"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["claude-fable-5"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "medium" },
    ["xhigh"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "xhigh" },
  },
}

M["claude-haiku-4-5"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 16000 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-opus-4-1"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 15999 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-opus-4-5"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { effort = "high" },
    ["low"] = { effort = "low" },
    ["medium"] = { effort = "medium" },
  },
}

M["claude-opus-4-6"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive" }, effort = "medium" },
  },
}

M["claude-opus-4-7"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "medium" },
    ["xhigh"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "xhigh" },
  },
}

M["claude-opus-4-8"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "medium" },
    ["xhigh"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "xhigh" },
  },
}

M["claude-sonnet-4"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 16000 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-sonnet-4-5"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 16000 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-sonnet-4-6"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive" }, effort = "medium" },
  },
}

M["claude-sonnet-5"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "medium" },
    ["xhigh"] = { thinking = { type = "adaptive", display = "summarized" }, effort = "xhigh" },
  },
}

M["deepseek-v4-flash"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["max"] = { reasoningEffort = "max" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["deepseek-v4-flash-free"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["max"] = { reasoningEffort = "max" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["deepseek-v4-pro"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["max"] = { reasoningEffort = "max" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["gemini-3-flash"] = {
  provider = "google",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "high" } },
    ["low"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "low" } },
    ["medium"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "medium" } },
    ["minimal"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "minimal" } },
  },
}

M["gemini-3.1-pro"] = {
  provider = "google",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "high" } },
    ["low"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "low" } },
    ["medium"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "medium" } },
  },
}

M["gemini-3.5-flash"] = {
  provider = "google",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "high" } },
    ["low"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "low" } },
    ["medium"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "medium" } },
    ["minimal"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "minimal" } },
  },
}

M["glm-5"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["glm-5.1"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["glm-5.2"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["max"] = { reasoningEffort = "max" },
  },
}

M["gpt-5"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["minimal"] = { reasoningEffort = "minimal", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5-codex"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5-nano"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["minimal"] = { reasoningEffort = "minimal", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1-codex"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1-codex-max"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1-codex-mini"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.2"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.2-codex"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.3-codex"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.3-codex-spark"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.4"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.4-mini"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.4-nano"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.4-pro"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.5"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.5-pro"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.6-luna"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.6-sol"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.6-terra"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["grok-4.5"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["grok-build-0.1"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["hy3-free"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["kimi-k2.5"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["kimi-k2.6"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["kimi-k2.7-code"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["mimo-v2.5-free"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["minimax-m2.5"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["minimax-m2.7"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
}

M["minimax-m3"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["none"] = { thinking = { type = "disabled" } },
    ["thinking"] = { thinking = { type = "adaptive" } },
  },
}

M["nemotron-3-ultra-free"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["north-mini-code-free"] = {
  provider = "openai",
  capabilities = {
    reasoning = true,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["none"] = { reasoningEffort = "none" },
  },
}

M["qwen3.5-plus"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
}

M["qwen3.6-plus"] = {
  provider = "anthropic",
  capabilities = {
    reasoning = true,
  },
}

return M
