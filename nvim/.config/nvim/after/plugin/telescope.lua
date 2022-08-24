local map = require("malbernaz.utils").map
local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  },
})

map("n", "<leader>c", function()
  builtin.find_files({
    prompt_title = "dotfiles",
    cwd = vim.fn.stdpath("config"),
    hidden = true,
  })
end)
map("n", "<c-p>", function()
  builtin.git_files({ hidden = true })
end)
map("n", "<c-f>", function()
  builtin.live_grep({ hidden = true })
end)
map("n", "<c-b>", builtin.buffers)
