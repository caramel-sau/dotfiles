return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>i", "<cmd>Format<cr>", desc = "Format" },
  },
  config = function()
    vim.api.nvim_create_user_command("Format", function(args)
      require("conform").format({
        async = true,
        lsp_fallback = true,
      })
    end, { range = true })

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- go = { "goimports", "gofmt" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        python = { "prettierd" },
        json = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        vue = { "prettierd", "prettier" },
        php = { "php_cs_fixer" },
        ["_"] = { "trim_whitespace" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_format = "fallback",
        timeout_ms = 500,
      },
      formatters = {
        php_cs_fixer = {
          command = vim.fn.stdpath("data") .. "/mason/bin/php-cs-fixer",
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
      },
      notify_on_error = true,
      notify_no_formatters = true,
    })
  end,
}
