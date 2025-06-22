local is_executable = require("utils.executable").is_executable
local os = require("utils.os").os
local home = require("utils.os").home
local get_child_folders = require("utils.helpers").get_child_folders
local lspconfig = require("configs.lsp.lspconfig")
local get_executable = require("utils.executable").get_executable
local lsp_utils = require("utils.lsp")

---@type NvPluginSpec
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  cond = is_executable("jdtls"),
  opts = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
    local config_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
    local cmd = {
      vim.fn.exepath("jdtls"),
      "-data",
      workspace_dir,
      "-configuration",
      config_dir,
    }

    local bundles = {} -- Later for dap and test

    local spring_boot_bundle_ok, spring_boot_bundle = pcall(function()
      return require("spring_boot").java_extensions()
    end)
    if spring_boot_bundle_ok then
      table.insert(bundles, spring_boot_bundle)
    end

    local java_debug_bundle = get_executable("*.jar", "share/java-debug-adapter")
    if java_debug_bundle ~= "" then
      table.insert(bundles, java_debug_bundle)
    end

    local lombok_bundle = get_executable("*.jar", "share/lombok-nightly")
    if lombok_bundle ~= "" then
      table.insert(bundles, lombok_bundle)
    end

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

    local opts = {
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
      init_options = {
        bundles = bundles,
      },
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = lsp_utils.is_inlay_hint_enabled("jdtls") and "all" or "none", ---@type "none" | "literals" | "all"
            },
          },
          format = {
            enabled = true,
            settings = {
              url = vim.fn.stdpath("data") .. "/lazy/google-styleguide/intellij-java-google-style.xml",
              name = "GoogleStyle",
            },
          },
          configuration = {
            runtimes = runtimes,
          },
        },
      },
      capabilities = lspconfig.capabilities,
      on_attach = lspconfig.on_attach,
      on_init = lspconfig.on_init,
      cmd_env = {
        JAVA_OPTS = vim.env.JAVA_OPTS or "-Xmx8g", -- For 8GB of ram? :P
      },
    }

    return opts
  end,
  config = function(_, opts)
    local function attach_jdtls()
      require("jdtls").start_or_attach(opts)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "java" },
      callback = attach_jdtls,
    })
  end,
  dependencies = {
    {
      "mason-org/mason.nvim",
      optional = true,
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
        },
      },
      opts_extend = {
        "registries",
      },
    },
    {
      "google/styleguide",
      name = "google-styleguide",
    },
    {
      "JavaHello/spring-boot.nvim",
      optional = true,
    },
  },
}
