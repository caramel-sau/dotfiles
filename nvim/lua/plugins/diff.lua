return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>hd", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "DiffviewOpen" },
    { "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", desc = "DiffviewFileHistory" },
  }
}
