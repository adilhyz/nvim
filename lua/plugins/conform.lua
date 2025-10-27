return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>s", function() require("conform").format({ async = true }) end, mode = "", desc = "Format buffer"
		},
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				sql = { "sql-formatter" },
				xml = { "xmlformatter" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier" },
				scss = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				graphql = { "prettierd", "prettier" },
				md = { "prettierd", "prettier" },
				txt = { "prettierd", "prettier" },
				toml = { "prettierd", "prettier" },
				yml = { "prettierd", "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},

			formatters = {
				stylua = {
					args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
				},
				prettier = {
					require_cwd = true,
					cwd = require("conform.util").root_file({
						"package.json",
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}),
				},
			},
		})
	end,
}
