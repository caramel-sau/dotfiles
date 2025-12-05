return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find_files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live_grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
  },
}
