return {
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				},
				WARN = { alt = { "WARNING" } },
				PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			},
			highlight = {
				before = "",         -- "fg" or "bg" or empty
				keyword = "wide",    -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
				after = "fg",        -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400,  -- ignore lines longer than this
				exclude = {},        -- list of file types to exclude highlighting
			},
		},
		keys = {
			{ "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
			{ "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
			{ "n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" } },
			{ "n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" } }
		}
	},
	{
		"vimichael/floatingtodo.nvim",
		event = "VeryLazy",
		config = function()
			local floatingtodo = require("floatingtodo")
			local target_file = vim.fn.expand("~/notes/todo.md")
			local directory_path = vim.fn.fnamemodify(target_file, ":h")

			-- INFO: Check directory
			if vim.fn.isdirectory(directory_path) == 0 then
				vim.fn.mkdir(directory_path, "p") -- parent folders
				print("📁 To-do Directory created: " .. directory_path)
			else
				-- print("✅ To-do Directory already exists: " .. directory_path)
			end

			-- NOTE: touch file
			if vim.fn.filereadable(target_file) == 0 then
				-- writefile dengan array kosong akan membuat file kosong
				local ok, err = pcall(vim.fn.writefile, {}, target_file)
				if ok then
					print("📝 To-do File created: " .. target_file)
				else
					vim.notify("Failed to Create file: " .. tostring(err), vim.log.levels.ERROR)
				end
			else
				-- print("✅ To-do File already exists: " .. target_file)
			end

			-- PERF: Setup Floating todo
			floatingtodo.setup({
				target_file = target_file,
				border = "single", -- single, rounded, etc.
				width = 0.8, -- width of window in % of screen size
				height = 0.8, -- height of window in % of screen size
				position = "topright", -- topleft, topright, bottomleft, bottomright
			})

			-- Keymap
			vim.keymap.set({ "n", "v" }, "<leader>td", ":Td<CR>", { silent = true, desc = "Open Floating Todo" })
		end,
	}
}
