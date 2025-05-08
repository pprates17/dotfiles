return {
    'norcalli/nvim-colorizer.lua',
    config = function()
	local config = require('colorizer')
	config.setup()
    end,
}
