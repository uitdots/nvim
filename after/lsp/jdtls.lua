local get_executable = require("utils.executable").get_executable
local home = require("utils.os").home
local lsp_utils = require("utils.lsp")
local os = require("utils.os").os

---Get the latest mise Java installation path
---@return string?
local get_mise_latest_java = function()
  local mise_java_latest = home .. "/.local/share/mise/installs/java/latest"
  local stat = vim.uv.fs_stat(mise_java_latest)
  if stat then
    -- Resolve symlink to get actual path
    local real_path = vim.uv.fs_realpath(mise_java_latest)
    if real_path and is_valid_jdk(real_path) then
      return real_path
    end
  end
  return nil
end

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

---Parse Java version from directory name or path
---@param path string
---@return integer? major_version
local parse_java_version = function(path)
  local dirname = vim.fn.fnamemodify(path, ":t")
  -- Match patterns like: java-25-openjdk, 11.0.2, 18, etc.
  local patterns = {
    "^java%-(%d+)", -- java-25-openjdk -> 25
    "^(%d+)%.%d+%.%d+$", -- 11.0.2 -> 11
    "^(%d+)%.%d+$", -- 11.0 -> 11
    "^(%d+)$", -- 11 -> 11
  }

  for _, pattern in ipairs(patterns) do
    local version = dirname:match(pattern)
    if version then
      return tonumber(version)
    end
  end
  return nil
end

---Validate if path is a valid JDK (not just JRE)
---@param path string
---@return boolean
local is_valid_jdk = function(path)
  -- Check for key JDK directories/files that distinguish JDK from JRE
  local jdk_indicators = {
    path .. "/bin/javac", -- Java compiler
    path .. "/include", -- C headers for JNI
  }

  for _, indicator in ipairs(jdk_indicators) do
    local stat = vim.uv.fs_stat(indicator)
    if stat then
      return true
    end
  end
  return false
end

local get_runtimes = function()
  ---@type {name: string, path: string}[]
  local runtimes = {}
  ---@type table<integer, string> version -> path mapping
  local version_map = {}

  -- Helper to add runtime if version is parsed successfully and JDK is valid
  local add_runtime = function(path)
    local version = parse_java_version(path)
    if version and is_valid_jdk(path) then
      version_map[version] = path
    end
  end

  if os == "Linux" then
    local scan = vim.uv.fs_scandir("/usr/lib/jvm")
    if scan then
      while true do
        local name, type = vim.uv.fs_scandir_next(scan)
        if not name then
          break
        end

        if type == "directory" or type == "link" then
          local full_path = "/usr/lib/jvm/" .. name
          -- Skip symlinks like 'default', 'default-runtime'
          if not name:match("^default") then
            add_runtime(full_path)
          end
        end
      end
    end
  elseif os == "Windows" then
    -- TODO: Windows later, please contribute :P
  end

  -- Scan mise installations last (will override system JDKs)
  local mise_java_dir = home .. "/.local/share/mise/installs/java"
  local scan = vim.uv.fs_scandir(mise_java_dir)
  if scan then
    while true do
      local name, type = vim.uv.fs_scandir_next(scan)
      if not name then
        break
      end

      -- Only process actual directories, skip symlinks and special files
      if type == "directory" then
        local full_path = mise_java_dir .. "/" .. name
        local stat = vim.uv.fs_stat(full_path)
        if stat and stat.type == "directory" then
          add_runtime(full_path)
        end
      end
    end
  end

  -- Convert version_map to runtimes array with proper JavaSE-X format
  for version, path in pairs(version_map) do
    -- Special handling for legacy Java versions
    local name
    if version >= 1 and version <= 8 then
      -- Java 1-8 use JavaSE-1.x naming
      name = "JavaSE-1." .. tostring(version)
    else
      -- Java 9+ use JavaSE-x naming
      name = "JavaSE-" .. tostring(version)
    end
    table.insert(runtimes, {
      name = name,
      path = path,
    })
  end

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
  cmd_env = (function()
    local env = {
      JAVA_OPTS = vim.env.JAVA_OPTS or "-Xmx8g", -- For 8GB of ram? :P
    }
    -- Set JAVA_HOME to latest mise Java if available
    local latest_java = get_mise_latest_java()
    if latest_java then
      env.JAVA_HOME = latest_java
    end
    return env
  end)(),
  init_options = {
    bundles = get_bundles(),
    extendedClientCapabilities = get_jdtls_extended_client_capabilities(),
  },
}
