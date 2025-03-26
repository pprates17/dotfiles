local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.d2 = {
  install_info = {
    url = "https://github.com/ravsii/tree-sitter-d2",
    files = { "src/parser.c" },
    branch = "main"
  },
  filetype = "d2",
}
vim.filetype.add({
    extension = {
	d2 = function()
	    return "d2", function(bufnr)
		vim.bo[bufnr].commentstring = "# %s"
	    end
	end,
    },
})
