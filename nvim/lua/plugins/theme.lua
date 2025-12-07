return {
  "folke/tokyonight.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd([[colorscheme tokyonight]])
    -- 透明化する関数
    local function make_transparent()
      local groups = {
        -- 基本
        "Normal", "NormalNC", "SignColumn", "EndOfBuffer",
        -- サイドバー / 境界線
        "NormalFloat", "FloatBorder", "VertSplit", "WinSeparator",
        -- Telescope
        "TelescopeNormal", "TelescopeBorder",
        -- NvimTree
        "NvimTreeNormal", "NvimTreeEndOfBuffer", "NvimTreeNormalNC",
      }

      for _, g in ipairs(groups) do
        vim.api.nvim_set_hl(0, g, { bg = "none" })
      end
    end

    -- 起動時
    make_transparent()

    -- カラースキーム変更時にも再適用
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.defer_fn(make_transparent, 50)
      end,
    })

    -- サイドバー（NvimTree / Neo-tree）が開くたびに再適用
    vim.api.nvim_create_autocmd("BufWinEnter", {
      pattern = { "NvimTree*" },
      callback = function()
        vim.defer_fn(make_transparent, 10)
      end,
    })
  end,
}
