return {
	"nacro90/numb.nvim",
	event = "CmdlineEnter",
	config = function()
		require("numb").setup()
	end,
	vim.keymap.set("n", "<C-g>", function()
		vim.api.nvim_feedkeys(":", "n", false)
		vim.cmd("doautocmd User NoiceCmdlineEnterGoToLine")
	end, { desc = "Go to line" })
	-- vim.keymap.set("n", "<C-l>", ":", { noremap = true, silent = false, desc = "Go to line" })
	-- vim.keymap.set("n", "<C-l>", function() require("snacks").dashboard.pick("lines") end, { desc = "Go to line (Snacks)", noremap = true, silent = true })
}
