return {
    cmd = {"lua-language-server"},
    filetypes = {"lua"},
    root_markers = {"init.lua",".git"},
    settings = {
	Lua = {
	    diagnostics = {
		globals = {
		    "vim"
		}	
	    }
	}
    }
}
