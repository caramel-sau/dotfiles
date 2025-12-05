-- # Documents
-- https://neovim.io/doc/user/quickref.html

if not vim.g.vscode then
  vim.cmd("language en_US.UTF-8")
  vim.o.encoding = "utf-8"
  vim.o.helplang = "ja"

  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.clipboard = "unnamedplus"
  vim.o.list = true
  vim.o.smartindent = true
  vim.o.expandtab = true
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.wrap = false
  vim.o.termguicolors = true
  vim.o.wildmenu = true
  vim.o.ruler = true
  vim.o.smartcase = true
  vim.o.ignorecase = true
  vim.o.showmatch = true
  vim.o.visualbell = true
  vim.o.scrolloff = 8
  vim.o.cmdheight = 1
  vim.opt.showtabline = 2
  vim.o.showcmd = true
  vim.opt.swapfile = false
  vim.opt.signcolumn = "yes"
  vim.cmd("highlight LineNr guifg=#8a70ac")
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
