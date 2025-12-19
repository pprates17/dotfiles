return {
    "shortcuts/no-neck-pain.nvim", version = "*",
    config = function()
	local config = require('no-neck-pain')
	config.setup({
	    width = 200,
	    mappings = {
		enabled = true,
		toggle = "<Leader>np"
	    }
	})
    end,
}
