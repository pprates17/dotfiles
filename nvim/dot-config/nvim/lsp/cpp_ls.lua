return {
    cmd = {
	"clangd",
    	"--compile-commands-dir=build",
	"--query-driver=/home/pedro-prates/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20251107/xtensa-esp-elf/bin/xtensa-esp-elf-gcc",
    	"--background-index",
	"--clang-tidy"
    },
    filetypes = {"c", "cpp"},
    root_markers = {"CMakeLists.txt",".git"}
}
