return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        xml = { "xmlformat" },
        json = { "fixjson" },
        html = { "htmlbeautifier" },
        yaml = { "yamlfmt" },
        go = { "goimports", "gofmt" },
        java = { "google-java-format" },
        rust = { "rustfmt" },
        terraform = { "terraform_fmt" },
        hcl = { "terragrunt_hclfmt" }
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
  end,
}
