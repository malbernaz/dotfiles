-- local header = [[
--                 __
-- ___     ___    ___   __  __ /\_\    ___ ___
-- / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\
--  /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \
--  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
--   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
-- ]]

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@module "snacks"
  ---@type snacks.Config
  init = function()
    local snacks = require("snacks")

    snacks.setup({
      bigfile = { enabled = true },
      -- dashboard = {
      --   enabled = true,
      --   preset = {
      --     header = header,
      --   },
      -- },
      terminal = { enabled = true },
      indent = { enabled = true, animate = { enabled = false } },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        -- your styles configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        notification_history = {
          backdrop = 100,
        },
      },
    })

    vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
  end,
  keys = {
    {
      "<leader>n",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "[N]otification History",
    },
    {
      "<leader>tn",
      function()
        require("snacks").notifier.hide()
      end,
      desc = "[T]oggle All [N]otifications",
    },
    {
      "<C-/>",
      function()
        require("snacks").terminal.toggle(nil)
      end,
      desc = "Toggle terminal",
    },
  },
}
