local api = vim.api

local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.map_buf(buf, mode, lhs, rhs, opts)
  local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

function M.set(k, v)
  api.nvim_set_option(k, v)
end

function M.set_buf(b, k, v)
  api.nvim_buf_set_option(b, k, v)
end

function M.noop() end

local border_symbols = {
  vertical = "│",
  horizontal = "─",
  fill = " ",
  corner = {
    topleft = "╭",
    topright = "╮",
    bottomleft = "╰",
    bottomright = "╯",
  },
}

function border_symbols:draw(width, height)
  local border_lines = {
    table.concat({
      border_symbols.corner.topleft,
      string.rep(border_symbols.horizontal, width),
      border_symbols.corner.topright,
    }),
  }

  local middle_line = table.concat({
    border_symbols.vertical,
    string.rep(border_symbols.fill, width),
    border_symbols.vertical,
  })

  for _ = 1, height do
    table.insert(border_lines, middle_line)
  end

  table.insert(
    border_lines,
    table.concat({
      border_symbols.corner.bottomleft,
      string.rep(border_symbols.horizontal, width),
      border_symbols.corner.bottomright,
    })
  )

  return border_lines
end

function M.floating_window_big(bufnr)
  local winnr_bak = vim.fn.winnr()
  local altwinnr_bak = vim.fn.winnr("#")
  local width, height = vim.o.columns, vim.o.lines
  local win_width = math.ceil(width * 0.8) - 4
  local win_height = math.ceil(height * 0.8)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- border
  local border_opts = {
    style = "minimal",
    relative = "editor",
    width = win_width + 2,
    height = win_height + 2,
    row = row - 1,
    col = col - 1,
  }

  local border_bufnr = api.nvim_create_buf(false, true)
  local border_lines = border_symbols:draw(win_width, win_height)
  local border_winnr = api.nvim_open_win(border_bufnr, true, border_opts)

  api.nvim_buf_set_lines(border_bufnr, 0, -1, false, border_lines)
  api.nvim_win_set_option(border_winnr, "winhl", "NormalFloat:")

  -- content
  local win_opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
  }

  local winnr = api.nvim_open_win(bufnr, true, win_opts)

  api.nvim_command(
    string.format([[autocmd BufWipeout <buffer> execute "silent bwipeout! %d"]], border_bufnr)
  )
  api.nvim_command(
    string.format(
      [[autocmd WinClosed  <buffer> execute "%dwincmd w" | execute "%dwincmd w"]],
      altwinnr_bak,
      winnr_bak
    )
  )

  M.map_buf(bufnr, "n", "q", ":q<cr>", { nowait = true, noremap = false, silent = false })
  M.map_buf(bufnr, "n", "<esc><esc>", ":q<cr>", { nowait = true, noremap = false, silent = false })

  return winnr
end

return M
