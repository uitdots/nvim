local is_executable = require("utils.executable").is_executable

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
    -- TODO: Add lombok later bruh
    require("mason-registry").get_package("jdtls")

    local opts = {
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
      init_options = {
        bundle = {}, -- Later for dap and test
      },
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = require("uitvim").options.lsp_inlayhint_enabled and "all" or "none", ---@type "none" | "literals" | "all"
            },
          },
        },
      },
      capabilities = require("configs.lsp.nvim-lspconfig").capabilities,
      on_attach = require("configs.lsp.nvim-lspconfig").on_attach,
      on_init = require("configs.lsp.nvim-lspconfig").on_init,
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
    "mason-org/mason.nvim",
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
}
