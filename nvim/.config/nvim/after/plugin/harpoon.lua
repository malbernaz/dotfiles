local harpoon = require("harpoon")
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local nmap = require("malbernaz.utils").nmap

harpoon.setup({
  menu = {
    width = 70,
  },
})

nmap("<leader>h", function()
  ui.toggle_quick_menu()
end)

nmap("<leader>ha", function()
  mark.add_file()
end)
