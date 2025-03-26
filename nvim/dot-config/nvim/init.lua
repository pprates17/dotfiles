vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.shiftwidth = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false

require("config.lazy")
require("config.parsers")
vim.cmd 'colorscheme kanagawa'

vim.keymap.set('i', 'jj', '<Esc>', {})
