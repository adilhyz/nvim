return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		-- Eviline config for lualine (TokyoNight Edition)
		-- Based on: shadmansaleh / glepnir
		-- Modified by: Adilhyz
		-- 🎨 Tokyo Night Color Palette
		-- stylua: ignore
		local lualine = require("lualine")
		local colors = {
			bg       = '#1a1b26',
			fg       = '#a9b1d6',
			yellow   = '#e0af68',
			cyan     = '#7dcfff',
			darkblue = '#0f111a',
			green    = '#9ece6a',
			orange   = '#ff9e64',
			violet   = '#bb9af7',
			magenta  = '#c678dd',
			blue     = '#7aa2f7',
			red      = '#f7768e',
			gray     = '#3b4261',
		}

		-- ⚙️ Conditions
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- 🧱 Base Config
		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.gray, bg = colors.bg } },
				},
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Helper: Insert to left/right section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- 🡒 Left Components
		ins_left({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 0, right = 1 },
		})

		ins_left({
			function()
				return "" --[[  󰕷     ]]
			end,
			color = function()
				local mode_color = {
					n = colors.blue,
					i = colors.green,
					v = colors.magenta,
					[""] = colors.magenta,
					V = colors.magenta,
					c = colors.yellow,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.cyan,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1 },
		})

		ins_left({
			"filesize",
			cond = conditions.buffer_not_empty,
			color = { fg = colors.yellow },
		})

		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = colors.cyan, gui = "bold" },
		})

		ins_left({ "location" })

		ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.cyan },
			},
		})

		-- Mid section separator
		ins_left({
			function()
				return "%="
			end,
		})

		-- 🧠 LSP status
		ins_left({
			function()
				local msg = "No Active LSP"
				local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = " LSP:",
			color = { fg = colors.violet, gui = "bold" },
		})

		-- 🡐 Right Components
		ins_right({
			"o:encoding",
			fmt = string.upper,
			cond = conditions.hide_in_width,
			color = { fg = colors.green, gui = "bold" },
		})

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false,
			color = { fg = colors.green, gui = "bold" },
		})

		ins_right({
			"branch",
			icon = "",
			color = { fg = colors.violet, gui = "bold" },
		})

		ins_right({
			"diff",
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		})

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 1 },
		})

		-- 🚀 Initialize Lualine
		lualine.setup(config)
	end
}
