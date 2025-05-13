return {
    "rebelot/kanagawa.nvim",
    config = function () 
	local configs = require("kanagawa")
	configs.setup({
	   transparent = true 
	})
    end
}
