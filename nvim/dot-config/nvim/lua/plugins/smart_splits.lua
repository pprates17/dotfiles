return
{
    'mrjones2014/smart-splits.nvim',
    build = './kitty/install-kittens.bash',
    config = function ()
	local config = require("smart-splits")
	config.setup({
	   -- multiplexer = 'kitty'
	})
    end
}
