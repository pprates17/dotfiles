vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

require("config.lazy")

vim.cmd 'colorscheme kanagawa'
