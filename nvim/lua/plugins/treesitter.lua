return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
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
        "vim",
        "markdown",
        "sql",
        "php",
        "vue",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
