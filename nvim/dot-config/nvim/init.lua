vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors=true
require("config.lazy")
require("config.lsp")
vim.cmd[[colorscheme tokyonight-night]]
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
--vim.cmd [[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight NormalNC guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--  highlight NormalNC ctermbg=none
--]]

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

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
