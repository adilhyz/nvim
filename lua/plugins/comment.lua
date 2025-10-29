return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require('ts_context_commentstring').setup()
			require('Comment').setup {
				padding = true,
				ignore = nil,
				mappings = {
					basic = true, ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
					extra = true, ---Includes `gco`, `gcO`, `gcA`
					extended = false, ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
				},
				---LHS of toggle mapping in NORMAL + VISUAL mode
				toggler = {
					---line-comment keymap
					line = '<C-/>',
					---block-comment keymap
					block = '<C-S-/>',
				},
				opleader = {
					---line-comment keymap
					line = '<C-/>',
					---block-comment keymap
					block = '<C-S-/>',
				},
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				post_hook = nil,
			}
		end
	},
	{
		"LudoPinelli/comment-box.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<A-/>", "<cmd>lua require('comment-box').llbox()<CR>", desc = "comment box" },
			{ "<A-/>", "<cmd>lua require('comment-box').llbox()<CR>", mode = "v",          desc = "comment box" },
		}
	},
}
