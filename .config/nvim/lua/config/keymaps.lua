-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
local diagnostic_goto = function(next, severity)
  local count = next and 1 or -1
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = count, severity = severity })
  end
end

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "[N]ext Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "[P]rev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "[N]ext Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "[P]rev Warning" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- resizing splits
vim.keymap.set("n", "<A-h>", function()
  require("smart-splits").resize_left()
end, { desc = "Resize split left" })
vim.keymap.set("n", "<A-j>", function()
  require("smart-splits").resize_down()
end, { desc = "Resize split down" })
vim.keymap.set("n", "<A-k>", function()
  require("smart-splits").resize_up()
end, { desc = "Resize split up" })
vim.keymap.set("n", "<A-l>", function()
  require("smart-splits").resize_right()
end, { desc = "Resize split right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", function()
  require("smart-splits").move_cursor_left()
end, { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", function()
  require("smart-splits").move_cursor_down()
end, { desc = "Move to down split" })
vim.keymap.set("n", "<C-k>", function()
  require("smart-splits").move_cursor_up()
end, { desc = "Move to up split" })
vim.keymap.set("n", "<C-l>", function()
  require("smart-splits").move_cursor_right()
end, { desc = "Move to right split" })
vim.keymap.set("n", "<C-\\>", function()
  require("smart-splits").move_cursor_previous()
end, { desc = "Move to preview split" })
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", function()
  require("smart-splits").swap_buf_left()
end, { desc = "Swap split left" })
vim.keymap.set("n", "<leader><leader>j", function()
  require("smart-splits").swap_buf_down()
end, { desc = "Swap split down" })
vim.keymap.set("n", "<leader><leader>k", function()
  require("smart-splits").swap_buf_up()
end, { desc = "Swap split up" })
vim.keymap.set("n", "<leader><leader>l", function()
  require("smart-splits").swap_buf_right()
end, { desc = "Swap split right" })

-- Move lines on visual mode
vim.keymap.set("v", "<s-j>", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "<s-k>", ":m '<-2<cr>gv=gv", { silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "[L]azy" })

-- Mason
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[M]ason" })

-- Better Copy/Paste
vim.keymap.set("n", "`p", '"0p', { desc = "Paste last yanked bellow" })
vim.keymap.set("n", "`P", '"0P', { desc = "Paste last yanked above" })
vim.keymap.set("v", "`p", '"0p', { desc = "Paste last yanked" })

-- Better redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
