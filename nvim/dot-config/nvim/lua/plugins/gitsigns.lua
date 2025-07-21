return {
    'lewis6991/gitsigns.nvim',
    config = function()
	local config = require('gitsigns')
	config.setup()
	vim.keymap.set('n','<leader>gs','<cmd>Gitsigns stage_hunk<cr>', { desc = "Stage current hunk" })
	vim.keymap.set('n','<leader>gn','<cmd>Gitsigns next_hunk<cr>', { desc = "Jump to next hunk" })
	vim.keymap.set('n','<leader>gp','<cmd>Gitsigns prev_hunk<cr>', { desc = "Jump to previous hunk" })
    end,
}
