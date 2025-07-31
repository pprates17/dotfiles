vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors=true
require("config.lazy")
require("config.lsp")
vim.cmd[[colorscheme kanagawa-wave]]
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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
