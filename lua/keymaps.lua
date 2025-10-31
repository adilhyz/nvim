-- ╭─────────────────────────────────────────────────────────╮
-- │ Modes                                                   │
-- ╰─────────────────────────────────────────────────────────╯
--   normal_mode       = 'n'
--   insert_mode       = 'i'
--   visual_mode       = 'v'
--   visual_block_mode = 'x'
--   term_mode         = 't'
--   command_mode      = 'c'

local keymap = vim.keymap.set
local exec = vim.cmd.exec
local cmd = vim.cmd

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function duplicate(direction)
	local mode = vim.fn.mode()
	local actions = {
		["v"] = { down = "normal! y`>p", up = "normal! y`<P" },
		["V"] = { down = "normal! y`>p", up = "normal! y`<P" },
		["default"] = { down = "t .", up = "t -1" },
	}
	local act = actions[mode] or actions["default"]
	cmd(act[direction])
end

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File Explorer" })

-- Quit Neovim
keymap("n", "<leader>q", ":q<cr>", { desc = "Quit Neovim", remap = true })
keymap("n", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("v", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("i", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("c", "<C-q>", "<cmd>quit<CR>", { noremap = true, silent = true })
keymap("i", "<RightMouse>", "<cmd>popup! PopUp<cr>", { noremap = true, silent = true })
keymap("v", "<RightMouse>", "<C-\\><C-g>gv<cmd>popup! PopUp<cr>", { noremap = true, silent = true })

-- New File
keymap("n", "<C-n>", ":enew | startinsert<CR>", { desc = "New File", noremap = true, silent = true })
keymap("n", "<C-t>", ":enew | startinsert<CR>", { desc = "New File", noremap = true, silent = true })
keymap("n", "<C-w>", ":BufferClose<CR>", { desc = "Buffer close", noremap = true })

-- Find {files,Text,Config}
keymap({ "n", "v" }, "<C-k>", function() Snacks.picker.keymaps() end, { desc = "Search Keymaps" })
keymap({ "n", "v" }, "<C-p>", function() Snacks.picker.files() end, { desc = "Find Files" })
keymap({ "n", "v" }, "<C-f>", function() Snacks.dashboard.pick('live_grep', { search_dirs = { vim.api.nvim_buf_get_name(0) } }) end, { desc = "Find Text (current file only)" })
keymap({ "n", "v" }, "<C-.>", function() Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') }) end, { desc = "Find Files" })

-- Replace Text
keymap("n", "<C-h>", ":%s/<Left>/<Left>/g", { desc = "Replace text (global)" })
keymap("n", "<C-d>", "*N", { desc = "Select next occurrence" })

-- Move Text on row up and down For Normal mode
keymap("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })

-- Move Text on row up and down For Visual mode
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- Duplicate line (Ctrl+Shift+Up/Down)
keymap({ "n", "i", "v" }, "<C-S-Down>", function() duplicate("down") end, { silent = true, desc = "Duplicate line down" })
keymap({ "n", "i", "v" }, "<C-S-Up>", function() duplicate("up") end, { silent = true, desc = "Duplicate line up" })

-- Save current file (Ctrl+s)
keymap("n", "<C-s>", ":w<cr>", { desc = "Save file", remap = true })

-- Select all (Ctrl+A)
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

-- Mapping for copy (ctrl+c)
keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
keymap('i', '<C-c>', '<ESC>"+y', { noremap = true, silent = true })
keymap('c', '<C-c>', '<C-c>"+y', { noremap = true, silent = true })

-- Mapping for paste (CTRL V)
keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })
keymap('i', '<C-v>', '<ESC>"+pa', { noremap = true, silent = true })
keymap('c', '<C-v>', '<C-c>"+p', { noremap = true, silent = true })

-- Mapping to cut (ctrl+x)
keymap('n', '<C-x>', '"+x', { noremap = true, silent = true })
keymap('v', '<C-x>', '"+x', { noremap = true, silent = true })
keymap('i', '<C-x>', '<ESC>"+x', { noremap = true, silent = true })
keymap('c', '<C-x>', '<C-c>"+x', { noremap = true, silent = true })

-- Mapping for Undo (Ctrl+Z)
keymap('', '<C-z>', '<cmd>undo<CR>', { noremap = true, silent = true })
keymap('i', '<C-z>', '<cmd>undo<CR>', { noremap = true, silent = true })

-- Mapping for redo (Ctrl+y)
keymap('', '<C-y>', '<cmd>redo<CR>', { noremap = true, silent = true })
keymap('i', '<C-y>', '<cmd>redo<CR>', { noremap = true, silent = true })

-- Mapping to select text in insertion mode
keymap('i', '<S-Left>', '<C-o>v', { noremap = true, silent = true })
keymap('i', '<S-Right>', '<C-o>ve', { noremap = true, silent = true })
keymap('i', '<S-Up>', '<C-o>v<Up>', { noremap = true, silent = true, desc = 'Select up' })
keymap('i', '<S-Down>', '<C-o>v<Down>', { noremap = true, silent = true, desc = 'Select down' })
keymap('i', '<S-Home>', '<C-o>v0', { noremap = true, silent = true, desc = 'Select to line start' })
keymap('i', '<S-End>', '<C-o>v$', { noremap = true, silent = true, desc = 'Select to line end' })
keymap('i', '<S-PageUp>', '<C-o>v<C-u>', { noremap = true, silent = true, desc = 'Select page up' })
keymap('i', '<S-PageDown>', '<C-o>v<C-d>', { noremap = true, silent = true, desc = 'Select page down' })

-- Tab Key
keymap("v", "<Tab>", ">gv", { desc = "Indenting", noremap = true, silent = true })
keymap("v", "<S-Tab>", "<gv", { desc = "Indenting", noremap = true, silent = true })

-- window management split
keymap("n", "<leader>sv", "<C-w>v")
keymap("n", "<leader>sh", "<C-w>s")
keymap("n", "<leader>se", "<C-w>=")
keymap("n", "<leader>sx", ":close<CR>")

-- New tab
keymap("n", "te", ":tabedit")

-- Barbar (Tab)
keymap("n", "<C-Tab>", ":BufferNext<CR>", { desc = "Move to next tab", noremap = true, silent = true })
keymap("n", "<C-S-Tab>", ":BufferPrevious<CR>", { desc = "Move to previous tab", noremap = true, silent = true })
keymap("n", "<A-p>", ":BufferPin<CR>", { desc = "Pin buffer", noremap = true, silent = true })

-- Menu Neovim
keymap({ "n", "v", "i" }, "<RightMouse>", function() require('menu.utils').delete_old_menus() exec '"normal! \\<RightMouse>"' local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid) local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default" require("menu").open(options, { mouse = true }) end, {})
