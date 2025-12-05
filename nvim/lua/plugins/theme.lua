return {
  "folke/tokyonight.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
