local filter_availabled_external = require("uitvim").options.filter_availabled_external
local is_executable = require("utils.executable").is_executable
local inlayhint_enabled = require("uitvim").options.lsp_inlayhint_enabled

---@type NvPluginSpec
return {
  "seblyng/roslyn.nvim",
  enabled = not filter_availabled_external or is_executable("dotnet"),
  ft = "cs",
  cmd = "Roslyn",
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    config = {
      settings = {
        ["csharp|inlay_hints"] = inlayhint_enabled and {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          csharp_enable_inlay_hints_for_types = true,
          dotnet_enable_inlay_hints_for_indexer_parameters = true,
          dotnet_enable_inlay_hints_for_literal_parameters = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          dotnet_enable_inlay_hints_for_other_parameters = true,
          dotnet_enable_inlay_hints_for_parameters = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        } or nil,
      },
    },
  },
}
