return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "echasnovski/mini.icons", opts = {} },
    lazy = false,
    config = function ()
	local config = require("oil")
	config.setup({
	    keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
    		["<C-s>"] = { "actions.select", opts = { vertical = true } },
		["<C-x>"] = { "actions.select", opts = { horizontal = true } }, --default C-h
    		["<C-t>"] = { "actions.select", opts = { tab = true } },
    		["<C-p>"] = "actions.preview",
    		["<C-c>"] = { "actions.close", mode = "n" },
		["<C-r>"] = "actions.refresh", --default: C-l
    		["-"] = { "actions.parent", mode = "n" },
    		["_"] = { "actions.open_cwd", mode = "n" },
    		["`"] = { "actions.cd", mode = "n" },
    		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    		["gs"] = { "actions.change_sort", mode = "n" },
    		["gx"] = "actions.open_external",
    		["g."] = { "actions.toggle_hidden", mode = "n" },
    		["g\\"] = { "actions.toggle_trash", mode = "n" },
	    },
	    use_default_keymaps = false
	})
	vim.keymap.set('n','<leader>oo','<cmd>Oil<cr>', { desc = "Open parent directory" })
	vim.keymap.set('n','<leader>op','<cmd>Oil --float<cr>', { desc = "Open parent directory float" })
    end,
}
