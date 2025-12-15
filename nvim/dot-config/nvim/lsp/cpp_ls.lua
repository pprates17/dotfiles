return {
    cmd = {"clangd"},
    filetypes = {"cpp"},
    root_markers = {".cpp",".git"},
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
