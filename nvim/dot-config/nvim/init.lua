vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors=true
require("config.lazy")
vim.cmd[[colorscheme nord]]
--vim.cmd("colorscheme kanagawa-dragon")
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

--vim.keymap.set('n', '<C-h>', '<C-w>h')
--vim.keymap.set('n', '<C-j>', '<C-w>j')
--vim.keymap.set('n', '<C-k>', '<C-w>k')
--vim.keymap.set('n', '<C-l>', '<C-w>l')
