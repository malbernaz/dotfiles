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

vim.keymap.set(
  "n",
  "<leader>cd",
  vim.diagnostic.open_float,
  { desc = "[C]ode [D]iagnostics" }
)
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set(
  "n",
  "]e",
  diagnostic_goto(true, "ERROR"),
  { desc = "[N]ext Error" }
)
vim.keymap.set(
  "n",
  "[e",
  diagnostic_goto(false, "ERROR"),
  { desc = "[P]rev Error" }
)
vim.keymap.set(
  "n",
  "]w",
  diagnostic_goto(true, "WARN"),
  { desc = "[N]ext Warning" }
)
vim.keymap.set(
  "n",
  "[w",
  diagnostic_goto(false, "WARN"),
  { desc = "[P]rev Warning" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
  "t",
  "<Esc><Esc>",
  "<C-\\><C-n>",
  { desc = "Exit terminal mode" }
)

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows

vim.keymap.set(
  "n",
  "<C-h>",
  "<C-w><C-h>",
  { desc = "Move focus to the left window" }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<C-w><C-l>",
  { desc = "Move focus to the right window" }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<C-w><C-j>",
  { desc = "Move focus to the lower window" }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<C-w><C-k>",
  { desc = "Move focus to the upper window" }
)

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

-- Terminal
vim.keymap.set({ "n", "t" }, "<c-/>", function()
  require("snacks.terminal").toggle(nil, { cwd = vim.uv.cwd() })
end, { desc = "Toggle terminal" })

-- Notifications
vim.keymap.set("n", "<leader>n", function()
  require("snacks.notifier").show_history()
end, { desc = "[N]otification History" })

vim.keymap.set("n", "<leader>tn", function()
  require("snacks.notifier").hide()
end, { desc = "[T]oggle All [N]otifications" })
