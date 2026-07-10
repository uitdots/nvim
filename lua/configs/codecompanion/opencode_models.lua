-- Auto-generated from `opencode models --verbose`
-- Do not edit manually.
-- Update: python3 scripts/update_opencode_models.py

local M = {}

M["big-pickle"] = {
  name = "Big Pickle",
  family = "big-pickle",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 200000,
    output = 32000,
  },
  cost = {
    input = 0,
    output = 0,
  },
}

M["claude-fable-5"] = {
  name = "Claude Fable 5",
  family = "claude-fable",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1000000,
    output = 128000,
  },
  cost = {
    input = 10,
    output = 50,
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
  name = "Claude Haiku 4.5",
  family = "claude-haiku",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 200000,
    output = 64000,
  },
  cost = {
    input = 1,
    output = 5,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 16000 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-opus-4-1"] = {
  name = "Claude Opus 4.1",
  family = "claude-opus",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 200000,
    output = 32000,
  },
  cost = {
    input = 15,
    output = 75,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 15999 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-opus-4-5"] = {
  name = "Claude Opus 4.5",
  family = "claude-opus",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 200000,
    output = 64000,
  },
  cost = {
    input = 5,
    output = 25,
  },
  variants = {
    ["high"] = { effort = "high" },
    ["low"] = { effort = "low" },
    ["medium"] = { effort = "medium" },
  },
}

M["claude-opus-4-6"] = {
  name = "Claude Opus 4.6",
  family = "claude-opus",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 128000,
  },
  cost = {
    input = 5,
    output = 25,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive" }, effort = "medium" },
  },
}

M["claude-opus-4-7"] = {
  name = "Claude Opus 4.7",
  family = "claude-opus",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1000000,
    output = 128000,
  },
  cost = {
    input = 5,
    output = 25,
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
  name = "Claude Opus 4.8",
  family = "claude-opus",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1000000,
    output = 128000,
  },
  cost = {
    input = 5,
    output = 25,
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
  name = "Claude Sonnet 4",
  family = "claude-sonnet",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 64000,
  },
  cost = {
    input = 3,
    output = 15,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 16000 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-sonnet-4-5"] = {
  name = "Claude Sonnet 4.5",
  family = "claude-sonnet",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 64000,
  },
  cost = {
    input = 3,
    output = 15,
  },
  variants = {
    ["high"] = { thinking = { type = "enabled", budgetTokens = 16000 } },
    ["max"] = { thinking = { type = "enabled", budgetTokens = 31999 } },
  },
}

M["claude-sonnet-4-6"] = {
  name = "Claude Sonnet 4.6",
  family = "claude-sonnet",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 64000,
  },
  cost = {
    input = 3,
    output = 15,
  },
  variants = {
    ["high"] = { thinking = { type = "adaptive" }, effort = "high" },
    ["low"] = { thinking = { type = "adaptive" }, effort = "low" },
    ["max"] = { thinking = { type = "adaptive" }, effort = "max" },
    ["medium"] = { thinking = { type = "adaptive" }, effort = "medium" },
  },
}

M["claude-sonnet-5"] = {
  name = "Claude Sonnet 5",
  family = "claude-sonnet",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1000000,
    output = 128000,
  },
  cost = {
    input = 2,
    output = 10,
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
  name = "DeepSeek V4 Flash",
  family = "deepseek-flash",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 384000,
  },
  cost = {
    input = 0.14,
    output = 0.28,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["max"] = { reasoningEffort = "max" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["deepseek-v4-flash-free"] = {
  name = "DeepSeek V4 Flash Free",
  family = "deepseek-flash-free",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 200000,
    output = 128000,
  },
  cost = {
    input = 0,
    output = 0,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["max"] = { reasoningEffort = "max" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["deepseek-v4-pro"] = {
  name = "DeepSeek V4 Pro",
  family = "deepseek-thinking",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 384000,
  },
  cost = {
    input = 1.74,
    output = 3.84,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["max"] = { reasoningEffort = "max" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["gemini-3-flash"] = {
  name = "Gemini 3 Flash",
  family = "gemini-flash",
  provider = "google",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1048576,
    output = 65536,
  },
  cost = {
    input = 0.5,
    output = 3,
  },
  variants = {
    ["high"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "high" } },
    ["low"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "low" } },
    ["medium"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "medium" } },
    ["minimal"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "minimal" } },
  },
}

M["gemini-3.1-pro"] = {
  name = "Gemini 3.1 Pro Preview",
  family = "gemini-pro",
  provider = "google",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1048576,
    output = 65536,
  },
  cost = {
    input = 2,
    output = 12,
  },
  variants = {
    ["high"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "high" } },
    ["low"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "low" } },
    ["medium"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "medium" } },
  },
}

M["gemini-3.5-flash"] = {
  name = "Gemini 3.5 Flash",
  family = "gemini-flash",
  provider = "google",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 1048576,
    output = 65536,
  },
  cost = {
    input = 1.5,
    output = 9,
  },
  variants = {
    ["high"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "high" } },
    ["low"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "low" } },
    ["medium"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "medium" } },
    ["minimal"] = { thinkingConfig = { includeThoughts = true, thinkingLevel = "minimal" } },
  },
}

M["glm-5"] = {
  name = "GLM-5",
  family = "glm",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 204800,
    output = 131072,
  },
  cost = {
    input = 1,
    output = 3.2,
  },
}

M["glm-5.1"] = {
  name = "GLM-5.1",
  family = "glm",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 204800,
    output = 131072,
  },
  cost = {
    input = 1.4,
    output = 4.4,
  },
}

M["glm-5.2"] = {
  name = "GLM-5.2",
  family = "glm",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 131072,
  },
  cost = {
    input = 1.4,
    output = 4.4,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["max"] = { reasoningEffort = "max" },
  },
}

M["gpt-5"] = {
  name = "GPT-5",
  family = "gpt",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.07,
    output = 8.5,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["minimal"] = { reasoningEffort = "minimal", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5-codex"] = {
  name = "GPT-5 Codex",
  family = "gpt-codex",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.07,
    output = 8.5,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5-nano"] = {
  name = "GPT-5 Nano",
  family = "gpt-nano",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 0.05,
    output = 0.4,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["minimal"] = { reasoningEffort = "minimal", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1"] = {
  name = "GPT-5.1",
  family = "gpt",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.07,
    output = 8.5,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["none"] = { reasoningEffort = "none", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1-codex"] = {
  name = "GPT-5.1 Codex",
  family = "gpt-codex",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.07,
    output = 8.5,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1-codex-max"] = {
  name = "GPT-5.1 Codex Max",
  family = "gpt-codex",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.25,
    output = 10,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.1-codex-mini"] = {
  name = "GPT-5.1 Codex Mini",
  family = "gpt-codex",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 0.25,
    output = 2,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.2"] = {
  name = "GPT-5.2",
  family = "gpt",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.75,
    output = 14,
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
  name = "GPT-5.2 Codex",
  family = "gpt-codex",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.75,
    output = 14,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["low"] = { reasoningEffort = "low", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.3-codex"] = {
  name = "GPT-5.3 Codex",
  family = "gpt-codex",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 1.75,
    output = 14,
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
  name = "GPT-5.3 Codex Spark",
  family = "gpt-codex-spark",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = false,
  },
  limit = {
    context = 128000,
    output = 128000,
  },
  cost = {
    input = 1.75,
    output = 14,
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
  name = "GPT-5.4",
  family = "gpt",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1050000,
    output = 128000,
  },
  cost = {
    input = 2.5,
    output = 15,
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
  name = "GPT-5.4 Mini",
  family = "gpt-mini",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 0.75,
    output = 4.5,
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
  name = "GPT-5.4 Nano",
  family = "gpt-nano",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 400000,
    output = 128000,
  },
  cost = {
    input = 0.2,
    output = 1.25,
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
  name = "GPT-5.4 Pro",
  family = "gpt-pro",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1050000,
    output = 128000,
  },
  cost = {
    input = 30,
    output = 180,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["gpt-5.5"] = {
  name = "GPT-5.5",
  family = "gpt",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1050000,
    output = 128000,
  },
  cost = {
    input = 5,
    output = 30,
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
  name = "GPT-5.5 Pro",
  family = "gpt-pro",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 1050000,
    output = 128000,
  },
  cost = {
    input = 30,
    output = 180,
  },
  variants = {
    ["high"] = { reasoningEffort = "high", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["medium"] = { reasoningEffort = "medium", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
    ["xhigh"] = { reasoningEffort = "xhigh", reasoningSummary = "auto", include = {"reasoning.encrypted_content"} },
  },
}

M["grok-4.5"] = {
  name = "Grok 4.5",
  family = "grok",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 500000,
    output = 500000,
  },
  cost = {
    input = 2,
    output = 6,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["grok-build-0.1"] = {
  name = "Grok Build 0.1",
  family = "grok-build",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 256000,
    output = 256000,
  },
  cost = {
    input = 1,
    output = 2,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["hy3-free"] = {
  name = "Hy3 Free",
  family = "hy3-free",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 190000,
    output = 64000,
  },
  cost = {
    input = 0,
    output = 0,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["kimi-k2.5"] = {
  name = "Kimi K2.5",
  family = "kimi-k2",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 262144,
    output = 65536,
  },
  cost = {
    input = 0.6,
    output = 3,
  },
}

M["kimi-k2.6"] = {
  name = "Kimi K2.6",
  family = "kimi-k2",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 262144,
    output = 65536,
  },
  cost = {
    input = 0.95,
    output = 4,
  },
}

M["kimi-k2.7-code"] = {
  name = "Kimi K2.7 Code",
  family = "kimi-k2",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = false,
  },
  limit = {
    context = 262144,
    output = 262144,
  },
  cost = {
    input = 0.95,
    output = 4,
  },
}

M["mimo-v2.5-free"] = {
  name = "MiMo V2.5 Free",
  family = "mimo-v2.5-free",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 200000,
    output = 32000,
  },
  cost = {
    input = 0,
    output = 0,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["minimax-m2.5"] = {
  name = "MiniMax-M2.5",
  family = "minimax",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 204800,
    output = 131072,
  },
  cost = {
    input = 0.3,
    output = 1.2,
  },
}

M["minimax-m2.7"] = {
  name = "MiniMax-M2.7",
  family = "minimax",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 204800,
    output = 131072,
  },
  cost = {
    input = 0.3,
    output = 1.2,
  },
}

M["minimax-m3"] = {
  name = "MiniMax-M3",
  family = "minimax",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 512000,
    output = 128000,
  },
  cost = {
    input = 0.3,
    output = 1.2,
  },
  variants = {
    ["none"] = { thinking = { type = "disabled" } },
    ["thinking"] = { thinking = { type = "adaptive" } },
  },
}

M["nemotron-3-ultra-free"] = {
  name = "Nemotron 3 Ultra Free",
  family = "nemotron-free",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 1000000,
    output = 128000,
  },
  cost = {
    input = 0,
    output = 0,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["low"] = { reasoningEffort = "low" },
    ["medium"] = { reasoningEffort = "medium" },
  },
}

M["north-mini-code-free"] = {
  name = "North Mini Code Free",
  family = "north-free",
  provider = "openai",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = false,
    temperature = true,
  },
  limit = {
    context = 256000,
    output = 64000,
  },
  cost = {
    input = 0,
    output = 0,
  },
  variants = {
    ["high"] = { reasoningEffort = "high" },
    ["none"] = { reasoningEffort = "none" },
  },
}

M["qwen3.5-plus"] = {
  name = "Qwen3.5 Plus",
  family = "qwen3.5",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 262144,
    output = 65536,
  },
  cost = {
    input = 0.2,
    output = 1.2,
  },
}

M["qwen3.6-plus"] = {
  name = "Qwen3.6 Plus",
  family = "qwen3.6",
  provider = "anthropic",
  capabilities = {
    reasoning = true,
    toolcall = true,
    attachment = true,
    temperature = true,
  },
  limit = {
    context = 262144,
    output = 65536,
  },
  cost = {
    input = 0.5,
    output = 3,
  },
}

return M
