return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	local configs = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', configs.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', configs.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', configs.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', configs.help_tags, { desc = 'Telescope help tags' })
    end
}
