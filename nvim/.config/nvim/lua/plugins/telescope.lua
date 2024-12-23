return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set(
      "n",
      "<leader>sh",
      builtin.help_tags,
      { desc = "[S]earch [H]elp" }
    )
    vim.keymap.set(
      "n",
      "<leader>sk",
      builtin.keymaps,
      { desc = "[S]earch [K]eymaps" }
    )
    vim.keymap.set("n", "<leader><leader>", function()
      builtin.find_files({ hidden = true, ignore = true })
    end, { desc = "[ ] Search Files" })
    vim.keymap.set(
      "n",
      "<leader>ss",
      builtin.builtin,
      { desc = "[S]earch [S]elect Telescope" }
    )
    vim.keymap.set("n", "<leader>sw", function()
      builtin.grep_string({ hidden = true, ignore = true })
    end, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", function()
      builtin.live_grep({ hidden = true, ignore = true })
    end, { desc = "[S]earch by [G]rep" })
    vim.keymap.set(
      "n",
      "<leader>sd",
      builtin.diagnostics,
      { desc = "[S]earch [D]iagnostics" }
    )
    vim.keymap.set(
      "n",
      "<leader>sr",
      builtin.resume,
      { desc = "[S]earch [R]esume" }
    )
    vim.keymap.set(
      "n",
      "<leader>s.",
      builtin.oldfiles,
      { desc = '[S]earch Recent Files ("." for repeat)' }
    )
    vim.keymap.set(
      "n",
      "<leader>sb",
      builtin.buffers,
      { desc = "[S]earch existing [B]uffers" }
    )

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        })
      )
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        hidden = true,
        ignore = true,
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
