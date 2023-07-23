local utils = require("malbernaz.utils")
local map = utils.map
local nmap = utils.nmap
local vmap = utils.vmap

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
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    nmap(']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true, buffer = bufnr})

    nmap('[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true, buffer = bufnr})

    -- Actions
    nmap('<leader>hs', gs.stage_hunk, {buffer = bufnr})
    nmap('<leader>hr', gs.reset_hunk, {buffer = bufnr})
    vmap('<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {buffer = bufnr})
    vmap('<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {buffer = bufnr})
    nmap('<leader>hS', gs.stage_buffer, {buffer = bufnr})
    nmap('<leader>hu', gs.undo_stage_hunk, {buffer = bufnr})
    nmap('<leader>hR', gs.reset_buffer, {buffer = bufnr})
    nmap('<leader>hp', gs.preview_hunk, {buffer = bufnr})
    nmap('<leader>hb', function() gs.blame_line{full=true} end, {buffer = bufnr})
    nmap('<leader>tb', gs.toggle_current_line_blame, {buffer = bufnr})
    nmap('<leader>hd', gs.diffthis, {buffer = bufnr})
    nmap('<leader>hD', function() gs.diffthis('~') end, {buffer = bufnr})
    nmap('<leader>td', gs.toggle_deleted, {buffer = bufnr})

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {buffer = bufnr})
  end,
})
