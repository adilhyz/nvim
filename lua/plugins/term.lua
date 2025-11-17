return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{ "<C-`>",  "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		{ "<C-s-`>",  "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
	},
	config = function()
		require("toggleterm").setup({
			size = 22,
			open_mapping = [[<c-s-`>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,

		})
		vim.cmd([[hi! WinSeparator guibg=NONE guifg=#2f334d]])
	end,
}
