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
  "vtsls",
  "marksman",
  "pylsp",
  "intelephense",
  "vue_ls",
  "emmet_language_server",
  "eslint",
  "gopls",
  "rust_analyzer",
}

local mason_tools = {
  "tree-sitter-cli",
  "prettierd",
  "prettier",
}

local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
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

local ensure_mason_tools = function(package_names)
  if #vim.api.nvim_list_uis() == 0 then
    return
  end

  local registry = require("mason-registry")

  for _, package_name in ipairs(package_names) do
    local ok, package = pcall(registry.get_package, package_name)
    if ok and not package:is_installed() then
      package:install()
    end
  end
end

ensure_mason_tools(mason_tools)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
  capabilities = capabilities,
})

require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
})

-- vue_ls は CSS/HTML を担当し、.vue 内の TypeScript は vtsls が担当する
vim.lsp.config('vtsls', {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      check = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.enable(lsp_servers)
