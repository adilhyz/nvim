return {
	"saghen/blink.cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim",
		{
			-- snippet plugin
			"L4MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets",
			opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			config = function(_, opts)
				require("luasnip").config.set_config(opts)
				-- vscode format
				require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
				require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

				-- snipmate format
				require("luasnip.loaders.from_snipmate").load()
				require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

				-- lua format
				require("luasnip.loaders.from_lua").load()
				require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

				-- fix luasnip #259
				vim.api.nvim_create_autocmd("InsertLeave", {
					callback = function()
						if
							require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
							and not require("luasnip").session.jump_active
						then
							require("luasnip").unlink_current()
						end
					end,
				})
			end,
		}
	},
	version = "2.*",
	opts = {
		keymap = {
			-- preset = "enter"
			["<CR>"]      = { "accept", "fallback" },
			["<Tab>"]     = { "select_next", "fallback" },
			["<S-Tab>"]   = { "select_prev", "fallback" },
			["<Down>"]    = { "fallback" },
			["<Up>"]      = { "fallback" },
			["<C-Space>"] = { "show" },
		},
		cmdline = {
			enabled = true,
		},
		completion = {
			menu = {
				border = "single",
				draw = {
					columns = {
						{ "label",     "label_description", gap = 1 },
						{ "kind_icon", gap = 1, "kind" },
					},
					treesitter = { 'lsp' },
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
			trigger = { show_in_snippet = false },
		},

		signature = {
			enabled = true,
			window = { border = 'single', show_documentation = false },
		},
		snippets = {
			preset = "luasnip", -- Choose LuaSnip as the snippet engine
		},
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "󰒓",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "󰕳",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		},

		sources = {
			-- default = { "lsp", "path", "snippets", "buffer" },
			-- inspired by github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/blink-cmp.lua
			default = { "lsp", "path", "snippets", "buffer", "emoji" },
			providers = {
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 26,
					fallbacks = { "snippets", "buffer" },
					-- min_keyword_length = 3,
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = true,
					},
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 4,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 3,
					score_offset = 16, -- the higher the number, the higher the priority
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 94, -- the higher the number, the higher the priority
					min_keyword_length = 3,
					opts = { insert = true }, -- Insert emoji (default) or complete its name
				},
			}
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }, --lua
	},
}
