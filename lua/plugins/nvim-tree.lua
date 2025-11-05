return {
	"nvim-tree/nvim-tree.lua",
	events = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		require("nvim-tree").setup({
			view = { width = 32 },
			renderer = {
				group_empty = true,
				highlight_git = true,
				root_folder_label = false,
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = { enable = true },
			actions = {
				open_file = { window_picker = { enable = false } },
			},
		})
		-- Global function to open the file under the cursor in a new tab
		_G.open_file_in_new_tab = function()
			local node = require("nvim-tree.api").tree.get_node_under_cursor()
			if node and node.absolute_path then
				vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))
			end
		end

		-- Mapping to open files in a new tab with Ctrl + Click
		vim.api.nvim_set_keymap('n', '<C-LeftMouse>', '<cmd>lua open_file_in_new_tab()<CR>',
		{ noremap = true, silent = true })
	end,
}
