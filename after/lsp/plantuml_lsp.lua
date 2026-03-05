local get_executable = require("utils.executable").get_executable

local jar = get_executable("plantuml.jar", { masons = "share/plantuml" }) ---@cast jar string?

---@type vim.lsp.Config
return {
  cmd = {
    "plantuml-lsp",
    string.format("--stdlib-path=%s/lazy/plantuml-stdlib", vim.fn.stdpath("data")),
    jar and string.format("--jar-path=%s", jar) or nil,
  },
  filetypes = {
    "plantuml",
  },
}
