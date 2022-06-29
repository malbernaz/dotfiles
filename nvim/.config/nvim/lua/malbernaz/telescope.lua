return function()
  local map = require("malbernaz.utils").map
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    },
    -- extensions = {
    --   fzy_native = {
    --     override_generic_sorter = false,
    --     override_file_sorter = true,
    --   },
    -- },
  })

  -- telescope.load_extension("fzy_native")

  map("n", "<c-p>", ":lua require('telescope.builtin').git_files({ hidden = true })<cr>")
  map("n", "<c-g>", ":lua require('telescope.builtin').live_grep({ hidden = true })<cr>")
  map("n", "<c-b>", ":Telescope buffers<cr>")
end
