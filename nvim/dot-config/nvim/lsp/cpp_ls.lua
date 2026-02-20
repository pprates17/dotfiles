return {
    cmd = {
	"clangd",
    	"--compile-commands-dir=build",
    	"--query-driver=/home/pedro-prates/.espressif/tools/**",
    	"--background-index",
    },
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
