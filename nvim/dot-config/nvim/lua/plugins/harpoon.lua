return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
	local  config = require("harpoon")
	config:setup()
	vim.keymap.set("n", "<leader>ha", function() config:list():add() end)
	vim.keymap.set("n", "<leader>hm", function() config.ui:toggle_quick_menu(config:list()) end)
	vim.keymap.set("n", "<leader>1", function() config:list():select(1) end)
	vim.keymap.set("n", "<leader>2", function() config:list():select(2) end)
	vim.keymap.set("n", "<leader>3", function() config:list():select(3) end)
	vim.keymap.set("n", "<leader>4", function() config:list():select(4) end)
	-- Toggle previous & next buffers stored within config list
	vim.keymap.set("n", "<leader>p", function() config:list():prev() end)
	vim.keymap.set("n", "<leader>n", function() config:list():next() end)
    end,
}
