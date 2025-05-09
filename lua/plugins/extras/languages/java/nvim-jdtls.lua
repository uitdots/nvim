local is_executable = require("utils.executable").is_executable
local os = require("utils.os").os
local home = require("utils.os").home
local get_child_folders = require("utils.helpers").get_child_folders
local lspconfig = require("configs.lsp.nvim-lspconfig")

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

    local java_debug_bundle = vim.fn.glob("$MASON/share/java-debug-adapter/*.jar")
    if java_debug_bundle ~= "" then
      table.insert(bundles, java_debug_bundle)
    end

    local lombok_bundle = vim.fn.glob("$MASON/share/lombok-nightly/*.jar")
    if lombok_bundle ~= "" then
      table.insert(bundles, lombok_bundle)
    end

    ---@type {name: string, path: string}[]
    local runtimes = {}
    ---@type string[]
    local runtime_paths = {}

    vim.list_extend(
      runtime_paths,
      get_child_folders(home .. "/.local/share/mise/installs/java", { follow_symlink = false }) or {}
    )
    if os == "Linux" then
      vim.list_extend(runtime_paths, get_child_folders("/usr/lib/jvm", { follow_symlink = false }) or {})
    elseif os == "Windows" then
      -- TODO: Windows later, please contribute :P
    end

    vim.list_extend(
      runtimes,
      vim.tbl_map(function(path)
        vim.print(path)
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
              enabled = require("uitvim").options.lsp_inlayhint_enabled and "all" or "none", ---@type "none" | "literals" | "all"
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
      opts = function(_, opts)
        opts = opts or {}
        if opts.registries ~= nil then
          opts.registries[#opts.registries + 1] = "github:nvim-java/mason-registry"
        else
          opts.registries = {
            "github:mason-org/mason-registry",
            "github:nvim-java/mason-registry",
          }
        end
        return opts
      end,
    },
    {
      "google/styleguide",
      name = "google-styleguide",
    },
    {
      "JavaHello/spring-boot.nvim",
    },
  },
}
