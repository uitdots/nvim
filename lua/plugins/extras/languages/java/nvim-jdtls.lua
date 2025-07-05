local is_executable = require("utils.executable").is_executable
local os = require("utils.os").os
local home = require("utils.os").home
local get_child_folders = require("utils.helpers").get_child_folders
local lspconfig = require("configs.lsp.lspconfig")
local lsp_utils = require("utils.lsp")

---@type NvPluginSpec
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  cond = is_executable("jdtls"),
  opts = function(_, opts) ---@cast opts NvimJdtlsOpts?
    opts = opts or {}
    opts.lspconfig = opts.lspconfig or {}

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = string.format("%s/jdtls/%s/workspace", vim.fn.stdpath("cache"), project_name)
    local config_dir = string.format("%s/jdtls/%s/config", vim.fn.stdpath("cache"), project_name)
    opts.lspconfig.cmd = {
      "jdtls",
      "-data",
      workspace_dir,
      "-configuration",
      config_dir,
    }

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

    opts.lspconfig = vim.tbl_deep_extend("force", opts.lspconfig, {
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
      },
      capabilities = lspconfig.capabilities,
      on_attach = lspconfig.on_attach,
      on_init = lspconfig.on_init,
      cmd_env = {
        JAVA_OPTS = vim.env.JAVA_OPTS or "-Xmx8g", -- For 8GB of ram? :P
      },
    })

    return opts
  end,
  ---@param opts NvimJdtlsOpts
  config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "java" },
      callback = function()
        require("jdtls").start_or_attach(opts.lspconfig)
      end,
    })
  end,
  specs = {
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
  },
}
