return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
          },
          file_ignore_patterns = { "node_modules/", ".git/" },
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- the default case_mode is "smart_case"
          }
        },
      })
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>",  desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",              desc = "Help Tags" },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = { "VeryLazy" },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
