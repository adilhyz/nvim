return {
	"saghen/blink.cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "rafamadriz/friendly-snippets",
	version = "1.*",
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

		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "lua" }, --prefer_rust_with_warning
	},
}
