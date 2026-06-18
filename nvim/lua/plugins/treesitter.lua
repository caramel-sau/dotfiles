return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "lua",
      "ruby",
      "go",
      "rust",
      "zig",
      "tsx",
      "javascript",
      "typescript",
      "json",
      "toml",
      "yaml",
      "html",
      "css",
      "vim",
      "markdown",
      "sql",
      "php",
      "vue",
    }

    require("nvim-treesitter").setup()
    if #vim.api.nvim_list_uis() > 0 then
      require("nvim-treesitter").install(parsers)
    end

    local parser_by_ft = {}
    for _, parser in ipairs(parsers) do
      parser_by_ft[parser] = true
    end

    local function start_treesitter(bufnr)
      if not parser_by_ft[vim.bo[bufnr].filetype] then
        return
      end

      pcall(vim.treesitter.start, bufnr)
      vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      pattern = parsers,
      callback = function(args)
        start_treesitter(args.buf)
      end,
    })

    start_treesitter(vim.api.nvim_get_current_buf())
  end,
}
