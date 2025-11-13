return {
	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install || npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"meanderingprogrammer/render-markdown.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
		config = function()
			require('render-markdown').setup({
				completions = { lsp = { enabled = true } },
			})
		end
	},
	{
		"frabjous/knap",
		ft = { "markdown", "pandoc" },
		config = function()
			-- Configure KNAP settings
			vim.g.knap_settings = {
				mdoutputext = "pdf",
				mdtopdf =
				"pandoc %docroot% -o %outputfile% --pdf-engine=xelatex --from markdown+raw_tex -V mainfont='Noto Sans' -V monofont='JetBrains Mono' -V CJKmainfont='Noto Sans CJK SC' -V emoji='Noto Color Emoji'",
				mdtopdfviewerlaunch = "zathura %outputfile%",
				mdtopdfviewerrefresh = "none",
				mdtopdfbufferasstdin = false,
			}

			-- Set up keymappings
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "pandoc", "md" },
				callback = function()
					local knap = require("knap")
					vim.keymap.set("n", "<leader>o", knap.process_once,
						{ buffer = true, desc = "Knap: compile once" })
					vim.keymap.set("n", "<leader>oq", knap.toggle_autopreviewing,
						{ buffer = true, desc = "Knap: toggle auto preview" })
				end,
			})
		end,
	}

}
