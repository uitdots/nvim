---@diagnostic disable: missing-fields

local lsp_utils = require("utils.lsp")

local inlayhint_opts
if lsp_utils.is_inlay_hint_enabled("texlab") then
  inlayhint_opts = {
    labelDefinitions = true,
    labelReferences = true,
    maxLength = nil, ---@type boolean
  }
end
---@type vim.lsp.Config
return {
  ---Setting is from here: https://github.com/latex-lsp/texlab/wiki/Configuration
  settings = {
    texlab = {
      build = {
        onSave = false,
        forwardSearchAfter = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true,
      },
      bibtexFormatter = "texlab", ---@type "latexindent" | "texlab"
      latexFormatter = "latexindent", ---@type "latexindent" | "texlab"
      inlayHints = inlayhint_opts,
    },
  },
}
