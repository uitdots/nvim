local get_executable = require("utils.executable").get_executable
local is_executable = require("utils.executable").is_executable
local os = require("utils.os").os
local home = require("utils.os").home
local get_child_folders = require("utils.helpers").get_child_folders
local lsp = require("configs.lsp")
local lsp_utils = require("utils.lsp")
local map = vim.keymap.set

---@type LazySpec
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  cond = is_executable("jdtls"),
  ---@param opts PluginsOpts.NvimJdtlsOpts?
  ---@return PluginsOpts.NvimJdtlsOpts
  opts = function(_, opts)
    opts = opts or {}
    opts.lspconfig = opts.lspconfig or {}
    opts.lspconfig.init_options = opts.lspconfig.init_options or {}
    opts.lspconfig.init_options.bundles = opts.lspconfig.init_options.bundles or {}

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
      masons = {
        "share/lombok-nightly",
        "packages/jdtls",
      },
    })
    if lombok_jar then
      table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
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

    ---@type elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>
    local function on_attach(_, bufnr)
      map("n", "<leader>lav", function()
        require("jdtls").extract_variable()
      end, {
        desc = "LSP Action | Extract Variable",
        buffer = bufnr,
      })

      map("v", "<leader>lav", function()
        require("jdtls").extract_variable({ visual = true })
      end, {
        desc = "LSP Action | Extract Variable",
        buffer = bufnr,
      })

      map("n", "<leader>lac", function()
        require("jdtls").extract_constant()
      end, {
        desc = "LSP Action | Extract Constant",
        buffer = bufnr,
      })

      map("v", "<leader>lac", function()
        require("jdtls").extract_constant({ visual = true })
      end, {
        desc = "LSP Action | Extract Constant",
        buffer = bufnr,
      })

      map("v", "<leader>lam", function()
        require("jdtls").extract_method()
      end, {
        desc = "LSP Action | Extract method",
        buffer = bufnr,
      })

      map("n", "<leader>Tc", function()
        require("jdtls").test_class()
      end, {
        desc = "Test | Test Java Class",
        buffer = bufnr,
      })

      map("n", "<leader>Tm", function()
        require("jdtls").test_nearest_method()
      end, {
        desc = "Test | Test Java Nearest Method",
        buffer = bufnr,
      })
    end

    ---@type vim.lsp.Config
    local jdtls_lspconfig = {
      cmd = cmd,
      workspace_required = true,
      root_markers = {
        "gradlew",
        ".git",
        "mvnw",
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
          },
          configuration = {
            runtimes = runtimes,
          },
        },
        redhat = {
          telemetry = {
            enabled = false,
          },
        },
      },
      capabilities = lsp.capabilities,
      on_attach = on_attach,
      on_init = lsp.on_init,
      cmd_env = {
        JAVA_OPTS = vim.env.JAVA_OPTS or "-Xmx8g", -- For 8GB of ram? :P
      },
    }

    opts.lspconfig = vim.tbl_deep_extend("force", opts.lspconfig, jdtls_lspconfig)

    return opts
  end,
  ---@param opts PluginsOpts.NvimJdtlsOpts
  config = function(_, opts)
    for _, bundle in ipairs(opts.bundles) do
      local bundle_item = bundle
      if type(bundle) == "function" then
        bundle_item = bundle()
      end
      ---@diagnostic disable-next-line: param-type-mismatch
      table.insert(opts.lspconfig.init_options.bundles, bundle_item)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "java" },
      callback = function()
        require("jdtls").start_or_attach(opts.lspconfig)
      end,
    })
  end,
}
