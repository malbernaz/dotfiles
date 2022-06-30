return function()
	local map = require("malbernaz.utils").map
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			file_sorter = require("telescope.sorters").get_fzy_sorter,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		},
	})

	map("n", "<c-p>", function()
		require("telescope.builtin").git_files({ hidden = true })
	end)
	map("n", "<c-g>", function()
		require("telescope.builtin").live_grep({ hidden = true })
	end)
	map("n", "<c-b>", ":Telescope buffers<cr>")
end
