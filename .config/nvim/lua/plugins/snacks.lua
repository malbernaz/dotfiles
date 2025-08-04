return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {

    bigfile = { enabled = true },
    terminal = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    notifier = { enabled = true },
    image = { enabled = true },
    rename = { enabled = true },
    styles = {
      notification_history = {
        backdrop = 100,
      },
    },
  },
}
