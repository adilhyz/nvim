return {
	"vimichael/floatingtodo.nvim",
	config = function()
		local floatingtodo = require("floatingtodo")
		local target_file = vim.fn.expand("~/notes/todo.md")
		local directory_path = vim.fn.fnamemodify(target_file, ":h")

		-- Cek dan buat direktori jika belum ada
		if vim.fn.isdirectory(directory_path) == 0 then
			vim.fn.mkdir(directory_path, "p") -- "p" buat parent folder juga
			print("📁 Directory created: " .. directory_path)
		else
			-- print("✅ Directory already exists: " .. directory_path)
		end

		-- Kalau file belum ada, buat file kosong (touch)
		if vim.fn.filereadable(target_file) == 0 then
			-- writefile dengan array kosong akan membuat file kosong
			local ok, err = pcall(vim.fn.writefile, {}, target_file)
			if ok then
				print("📝 File created: " .. target_file)
			else
				vim.notify("Gagal membuat file: " .. tostring(err), vim.log.levels.ERROR)
			end
		else
			-- print("✅ File already exists: " .. target_file)
		end

		-- Konfigurasi plugin
		floatingtodo.setup({
			target_file = target_file,
			border = "single", -- single, rounded, etc.
			width = 0.8,   -- width of window in % of screen size
			height = 0.8,  -- height of window in % of screen size
			position = "topright", -- topleft, topright, bottomleft, bottomright
		})

		-- Keymap
		vim.keymap.set({"n", "v"}, "<leader>td", ":Td<CR>", { silent = true, desc = "Open Floating Todo" })
	end,
}
