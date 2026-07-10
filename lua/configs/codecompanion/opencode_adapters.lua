-- OpenCode Zen and Go adapters for CodeCompanion
-- Docs: https://opencode.ai/docs/zen

local M = {}

---OpenCode Zen - curated models via OpenCode's AI gateway
---@return CodeCompanion.HTTPAdapter
function M.opencode_zen()
  local adapter = require("codecompanion.adapters").extend("openai_compatible", {
    name = "opencode_zen",
    formatted_name = "OpenCode Zen",
    env = {
      api_key = function()
        return os.getenv("OPENCODE_ZEN_API_KEY") or os.getenv("OPENCODE_API_KEY")
      end,
      url = "https://opencode.ai/zen",
    },
    schema = {
      model = {
        default = "mimo-v2.5-free",
      },
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
      api_key = "OPENCODE_API_KEY",
      url = "https://opencode.ai/zen/go",
    },
    schema = {
      model = {
        default = "mimo-v2.5",
      },
    },
  })
  ---@cast adapter CodeCompanion.HTTPAdapter
  return adapter
end

return M
