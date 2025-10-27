local excluded = {
	"node_modules/",
	".local/",
	".cache/",
	"public",
	"resources",

	"package-lock.json",
	"pnpm-lock.yaml",
	"yarn.lock",
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- animate = {},
		notifier = { enabled = true },
		indent = {
			enabled = false, -- I use hlchunk for indent
			-- animate = {
			-- 	enabled = vim.fn.has("nvim-0.10") == 1,
			-- 	style = "out",
			-- 	easing = "linear",
			-- 	duration = {
			-- 		step = 20, -- ms per step
			-- 		total = 500, -- maximum duration
			-- 	},
			-- },
		},

		dashboard = {
			-- These settings are used by some built-in sections
			preset = {
				-- default keymaps.
				keys = {
					{ icon = " ", key = "<C-p>", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "<C-n>", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "<C-f>", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "<C-.>", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = " ", key = "<C-l>", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					-- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				-- Used by the `header` section
				header = vim.fn.join({
					"                                           ⡤      ",
					"                                ⢀⣤⣶⣶⣶⣤⣀⣀  ⡸⠇⠒     ",
					"                               ⢠⣿⡿⣿⣿⣿⣿⡋⣛⢻⣯⣶⣶⣷⣧    ",
					"                               ⠘⣯⣀⣸⣷⣾⣷⣿⣋⣿⠿⠟⠿⣿⣿⡶⠂  ",
					"                                ⣝⣿⣿⣺⠋⢻⢿⣠⣿⡀  ⣟⠈⠁   ",
					"                                ⠘⣉⡳⣿⣿⠻⠒⡄⣿⣿⡷⠿⠿⡿⠆⠅⠂ ",
					"      ⠈⣧⡀⣩⣽⠆⠉⡽ ⢸⠉⡇ ⢸⠉⡇ ⠈⣧⡀    ⢠⣾⣿⣿⣿⣿⣷⣄⢸⠷⣿⣿⡷⡗⠊  ⣘⠁ ",
					"      ⠐⠛⠃⠓⠶ ⠘⠃⠐⠘⠲⠃⠂⠘⠲⠃⠂⠐⠛⠃   ⠐⣿⠉⠉⣟⠻⣿⡿⡿⢷⣶⣲⠐⢷⣦⣄⣰⣿⡟⡀ ",
					"                             ⢨⣻⣿⣿⣻⠿⢿⣶⣞⣋⣳⠾⠟⢳⣿⡟⢏ ⢀⠄ ",
					"                             ⠸⠻⠟⠛⣁⡀⢨⣿⣿⣿⣿⣿⣷⡯⠔⣉⣈⣳⡇  ",
					"                                ⢸⣻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡡⢂⡤⠴⠟ ",
					"                                 ⠁⣸⣟⠁ ⢹⣦⣤⣿⣿⡿⣫⠨⣆⣀⡠ ",
					"                                  ⠠⠿⣷⣾⣿⣛⡟⠁⠘⠛⠁⠠⠿⠅  ",
				}, "\n")
			},
		},

		picker = {
			sources = {
				explorer = {
					enabled = false,
					auto_close = false,
					hidden = true,
					ignored = true,

					layout = {
						layout = { position = "left" },
					},
				},
				files = {
					hidden = true,
					ignored = true,
					exclude = excluded,
				},
			},
			hidden = true,
			ignored = true,
		},

		scroll = {},
	},

	keys = {
		-- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" }, --disabled explorer
		-- ╭─────────────────────────────────────────────────────────╮
		-- │ Zen Mode                                                │
		-- ╰─────────────────────────────────────────────────────────╯
		{ "<leader>z",       function() Snacks.zen({ win = { width = 200 } }) end,                   desc = "Zen Mode" },
		{ "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Zoom Mode" },
		-- Top Pickers & 
		{ "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
		{ "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
		--  find
		{ "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
		{ "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
		{ "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
		{ "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
		-- ╭─────────────────────────────────────────────────────────╮
		-- │ Lazygit                                                 │
		-- ╰─────────────────────────────────────────────────────────╯
		{ "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
		{ "<leader>gl",     function() Snacks.lazygit.log() end,                                    desc = "Lazygit Log (cwd)" },
		{ "<leader>glf",     function() Snacks.lazygit.log_file() end,                               desc = "Lazygit Current File History" },
		-- git
		{ "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
		{ "<leader>gL",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
		{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
		{ "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
		{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
		-- LSP
		{ "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
		{ "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
		{ "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                        desc = "References" },
		{ "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
		{ "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
		{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
		{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
	},

}
