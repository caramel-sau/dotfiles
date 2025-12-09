return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    -- デフォルトのTabマッピングを無効化
    vim.g.copilot_no_tab_map = true
    -- Ctrl-Enterで提案を受け入れるマッピング
    vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}
