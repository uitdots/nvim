local get_child_folders = require("utils.helpers").get_child_folders
local get_executable = require("utils.executable").get_executable
local home = require("utils.os").home
local lsp_utils = require("utils.lsp")
local os = require("utils.os").os

---@return string[]
local get_cmd = function()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = string.format("%s/jdtls/%s/workspace", vim.fn.stdpath("cache"), project_name)
  local config_dir = string.format("%s/jdtls/%s/config", vim.fn.stdpath("cache"), project_name)
  local cmd = {
    "jdtls",
    "-data",
    workspace_dir,
    "-configuration",
    config_dir,
  }

  local lombok_jar = get_executable("lombok.jar", {
    masons = "packages/jdtls",
  })
  if lombok_jar then
    table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
  end
  return cmd
end

local get_runtimes = function()
  ---@type {name: string, path: string}[]
  local runtimes = {}
  ---@type string[]
  local runtime_paths = {}

  vim.list_extend(runtime_paths, get_child_folders(home .. "/.local/share/mise/installs/java", { follow_symlink = false }) or {})

  if os == "Linux" then
    vim.list_extend(runtime_paths, get_child_folders("/usr/lib/jvm", { follow_symlink = false }) or {})
  elseif os == "Windows" then
    -- TODO: Windows later, please contribute :P
  end

  vim.list_extend(
    runtimes,
    vim.tbl_map(function(path)
      return {
        name = "mise " .. vim.fn.fnamemodify(path, ":t"),
        path = path,
      }
    end, runtime_paths)
  )
  return runtimes
end

local get_format = function()
  local path = vim.fn.stdpath("data") .. "/lazy/java-google-styleguide/intellij-java-google-style.xml"
  local existed = vim.loop.fs_stat(path)
  return {
    enabled = true,
    settings = {
      url = existed and path or "https://raw.githubusercontent.com/google/styleguide/refs/heads/gh-pages/intellij-java-google-style.xml",
      name = "GoogleStyle",
    },
  }
end

---@return string[]?
local get_bundles_java_test = function()
  ---@type string[]
  local jars = vim.fn.glob("$MASON/share/java-test/*.jar", false, true)
  if #jars == 0 then
    return
  end
  local excludes = {
    ["com.microsoft.java.test.runner-jar-with-dependencies.jar"] = true,
    ["jacocoagent.jar"] = true,
  }
  local bundles = {}
  for _, jar in ipairs(jars) do
    if not excludes[vim.fn.fnamemodify(jar, ":t")] then
      table.insert(bundles, jar)
    end
  end
  return bundles
end

---return string
local get_bundles_dap = function()
  ---@type string
  local jar = vim.fn.glob("$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar", false, false)
  if jar == "" then
    return
  end
  return jar
end

local get_bundles = function()
  ---@type string[]
  local bundles = {}
  local java_test = get_bundles_java_test()
  local dap_jar = get_bundles_dap()
  local spring_boot_ok, spring_boot = pcall(function()
    return require("spring_boot").java_extensions()
  end)
  if java_test then
    vim.list_extend(bundles, java_test)
  end
  if dap_jar then
    table.insert(bundles, dap_jar)
  end
  if spring_boot_ok and spring_boot then
    ---@cast spring_boot string[]
    vim.list_extend(bundles, spring_boot)
  end
  return bundles
end

local get_jdtls_extended_client_capabilities = function()
  local ok, jdtls_capabilities = pcall(require, "jdtls.capabilities")
  if ok then
    return jdtls_capabilities
  end
end

---@type vim.lsp.Config
return {
  cmd = get_cmd(),
  ---@module 'codesettings'
  ---@type lsp.jdtls
  settings = {
    java = {
      signatureHelp = {
        enabled = true,
      },
      contentProvider = {
        preferred = "fernflower",
      },
      inlayHints = {
        parameterNames = {
          enabled = lsp_utils.is_inlay_hint_enabled("jdtls") and "all" or "none", ---@type "none" | "literals" | "all"
        },
      },
      configuration = {
        runtimes = get_runtimes(),
      },
      format = get_format(),
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
  },
  handlers = {
    -- https://github.com/CcccX2017/nvim/blob/d6bda5614c12926b92e88bc5bf48f069bc024da7/lua/plugins/java.lua#L34
    -- https://www.reddit.com/r/neovim/comments/1jbzqp5/comment/mi4ox6v/
    ["$/progress"] = function(_, result, ctx)
      local message = result.value.message or ""
      if message:find("Validate documents") or message:find("Publish Diagnostics") or message:find("Building") then
        return
      end
      return vim.lsp.handlers["$/progress"](_, result, ctx)
    end,
  },
  cmd_env = {
    JAVA_OPTS = vim.env.JAVA_OPTS or "-Xmx8g", -- For 8GB of ram? :P
  },
  init_options = {
    bundles = get_bundles(),
    extendedClientCapabilities = get_jdtls_extended_client_capabilities(),
  },
}
