return function()
  require("gitsigns").setup({
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "▎",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = "▎",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = "▶",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = "▶",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "▎",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    preview_config = { border = "rounded" },
    keymaps = {
      noremap = true,
      ["n ]c"] = { expr = true, "&diff ? ']c' : ':Gitsigns next_hunk<cr>'" },
      ["n [c"] = { expr = true, "&diff ? '[c' : ':Gitsigns prev_hunk<cr>'" },
      ["n <leader>hs"] = ":Gitsigns stage_hunk<cr>",
      ["v <leader>hs"] = ":Gitsigns stage_hunk<cr>",
      ["n <leader>hS"] = ":Gitsigns stage_buffer<cr>",
      ["n <leader>hu"] = ":Gitsigns undo_stage_hunk<cr>",
      ["n <leader>hr"] = ":Gitsigns reset_hunk<cr>",
      ["v <leader>hr"] = ":Gitsigns reset_hunk<cr>",
      ["n <leader>hR"] = ":Gitsigns reset_buffer<cr>",
      ["n <leader>hp"] = ":Gitsigns preview_hunk<cr>",
      ["n <leader>hb"] = ':lua require"gitsigns".blame_line{full=true}<cr>',
      ["n <leader>tb"] = ":Gitsigns toggle_current_line_blame<cr>",
      ["n <leader>hd"] = ":Gitsigns diffthis<cr>",
      ["n <leader>hD"] = ":Gitsigns diffthis ~<cr>",
      ["n <leader>td"] = ":Gitsigns toggle_deleted<cr>",
      ["o ih"] = ":<c-U>>Gitsigns select_hunk<cr>",
      ["x ih"] = ":<c-U>>Gitsigns select_hunk<cr>",
    },
  })
end
