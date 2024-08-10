return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- LSP
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "pyright",
        "jsonls",
        "gopls",
        "bashls",
        "dockerls",
        "terraformls",
        "docker_compose_language_service",
        "jdtls",
        "rust_analyzer",
        "helm_ls",
        "yamlls",
        -- Formatter
        "stylua",
        "prettierd",
        "xmlformat",
        "jq",
        "htmlbeautifier",
        "yamlfmt",
        "goimports",
        "gofmt",
        "googlejava-format",
        "rustfmt",
        "terraform_fmt",
        "terragrunt_hclfmt",
        "black",
        -- Linter
        "mypy",
        "ruff",
        "eslintd",
        "gitlint",
        "glint",
        "gospel",
        "yamllint",
        -- Debugger
        "debugpy",
      },
      -- auto-install config server (with lspconfig)
      automatic_installation = true,
    })
  end,
}
