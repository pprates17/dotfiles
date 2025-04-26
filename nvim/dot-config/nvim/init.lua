vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require("config.lazy")
vim.cmd("colorscheme kanagawa-wave")
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = '80'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
