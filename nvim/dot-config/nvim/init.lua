vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors=true
require("config.lazy")
require("config.lsp")
vim.cmd[[colorscheme tokyonight]]
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

-- Allow transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
--vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
--vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
--vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
--vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
---- moving between splits
--vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
--vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
--vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
--vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
--vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
---- swapping buffers between windows
--vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
--vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
--vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
--vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
--vim.g.smart_splits_debug_mode = true
--
--
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local yazi = Terminal:new({ cmd = "yz", hidden = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- LSP config
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
  end,
})
