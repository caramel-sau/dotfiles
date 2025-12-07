-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins.autopairs" },
    { import = "plugins.conform" },
    { import = "plugins.lualine" },
    { import = "plugins.tree" },
    -- { import = "plugins.avante" },
    { import = "plugins.fzf" },
    { import = "plugins.cmp" },
    { import = "plugins.mason-lspconfig" },
    { import = "plugins.treesitter" },
    { import = "plugins.indent" },
    { import = "plugins.theme" },
    { import = "plugins.indent" },
    { import = "plugins.diff" },
    { import = "plugins.copilot" },
    { import = "plugins.gitsigns" },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
