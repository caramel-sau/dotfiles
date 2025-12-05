return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "ruby",
        "go",
        "zig",
        "tsx",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "html",
        "css",
        "lua",
        "vim",
        "markdown",
        "sql",
        "yaml",
        "php",
        "vue",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
