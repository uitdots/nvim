local disallowed_filenames = {
  ["build.gradle.kts"] = true,
  ["settings.gradle.kts"] = true,
}

---@type vim.lsp.Config
return {
  root_dir = function(_, on_dir)
    local fname = vim.fn.expand("%:t")
    if not disallowed_filenames[fname] then
      on_dir()
    end
  end,
}
