return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "echasnovski/mini.icons", opts = {} },
    lazy = false,
    config = function ()
	local config = require("oil")
	config:setup() 
	vim.keymap.set('n','<leader>oo','<cmd>Oil<cr>', { desc = "Open parent directory" })
	vim.keymap.set('n','<leader>op','<cmd>Oil --float<cr>', { desc = "Open parent directory float" })
    end,
}
