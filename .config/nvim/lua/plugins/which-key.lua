return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  opts = {
    preset = "helix",
    icons = {
      mappings = true,
    },

    -- Document existing key chains
    spec = {
      { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>g", group = "[G]it", mode = { "n", "v" } },
    },
  },
}
