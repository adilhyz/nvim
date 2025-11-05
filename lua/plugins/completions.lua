return {
	"saghen/blink.cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {  "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
	version = "1.*",
	opts = {
		keymap = {
			-- preset = "enter"
			["<CR>"]      = { "accept", "fallback" },
			["<S-Down>"]  = { "select_next", "fallback" },
			["<S-Up>"]    = { "select_prev", "fallback" },
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
