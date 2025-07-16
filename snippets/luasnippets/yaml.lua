local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

return {
  s(
    {
      trig = "sk(%w+)%-(%d+%.%d+)",
      regTrig = true,
      hidden = false,
      desc = "K8s schema with version",
    },
    f(function(_, snip)
      return "# yaml-language-server: $schema=https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v" .. snip.captures[2] .. "-standalone-strict/" .. snip.captures[1] .. ".json"
    end, {})
  ),
  s(
    {
      trig = "sk(%w+)",
      regTrig = true,
      hidden = false,
      desc = "K8s schema",
    },
    f(function(_, snip)
      return "# yaml-language-server: $schema=https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/" .. snip.captures[1] .. ".json"
    end, {})
  ),
}
