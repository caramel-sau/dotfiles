local lsp_servers = {
  "lua_ls",
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "html",
  "jsonls",
  "ts_ls",
  "vtsls",
  "marksman",
  "pylsp",
  "intelephense",
  "vue_ls",
  "emmet_language_server",
  "eslint",
  "gopls",
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "→",
      package_uninstalled = "×",
    },
  },
})

local on_attach = function(client, bufnr)
  local buf_map = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- 定義に飛ぶ
  buf_map('n', 'gd', vim.lsp.buf.definition)
  -- 宣言に飛ぶ
  buf_map('n', 'gD', vim.lsp.buf.declaration)
  -- 型定義に飛ぶ
  buf_map('n', 'gy', vim.lsp.buf.type_definition)
  -- 参照に飛ぶ
  buf_map('n', 'gr', vim.lsp.buf.references)
  -- 実装に飛ぶ
  buf_map('n', 'gi', vim.lsp.buf.implementation)
end

vim.lsp.config('*', {
  on_attach = on_attach,
})

require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- vue_ls は事前に ts_ls と vtsls を設定しておく必要がある
vim.lsp.config('ts_ls', {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
})
vim.lsp.config('vtsls', {
  filetypes = { "javascript", "typescript", "vue" },
})

vim.lsp.enable(lsp_servers)
