return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    terminal = {},
    indent = { animate = { enabled = false } },
    input = {},
    notifier = {},
    image = {},
    picker = {
      layout = function()
        return {
          layout = {
            backdrop = false,
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            {
              win = "preview",
              title = "{preview}",
              border = "rounded",
              width = 0.5,
            },
          },
        }
      end,
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        require("snacks.picker").smart()
      end,
      desc = "[ ] Smart Find Files",
    },
    {
      "<leader>sb",
      function()
        require("snacks.picker").buffers()
      end,
      desc = "[S]earch [B]uffers",
    },
    {
      "<leader>/",
      function()
        require("snacks.picker").grep()
      end,
      desc = "[/] Grep",
    },
    {
      "<leader>:",
      function()
        require("snacks.picker").command_history()
      end,
      desc = "[:] Command History",
    },
    {
      "<leader>n",
      function()
        require("snacks.picker").notifications()
      end,
      desc = "[N]otification History",
    },
    -- find
    {
      "<leader>fb",
      function()
        require("snacks.picker").buffers()
      end,
      desc = "[F]ind [B]uffers",
    },
    {
      "<leader>fc",
      function()
        require("snacks.picker").files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "[F]ind [C]onfig File",
    },
    {
      "<leader>ff",
      function()
        require("snacks.picker").files()
      end,
      desc = "[F]ind [F]iles",
    },
    {
      "<leader>fg",
      function()
        require("snacks.picker").git_files()
      end,
      desc = "[F]ind [G]it Files",
    },
    {
      "<leader>fp",
      function()
        require("snacks.picker").projects()
      end,
      desc = "[F]ind [P]rojects",
    },
    {
      "<leader>fr",
      function()
        require("snacks.picker").recent()
      end,
      desc = "[F]ind [R]ecent",
    },
    -- git
    {
      "<leader>gb",
      function()
        require("snacks.picker").git_branches()
      end,
      desc = "[G]it [B]ranches",
    },
    {
      "<leader>gl",
      function()
        require("snacks.picker").git_log()
      end,
      desc = "[G]it [L]og",
    },
    {
      "<leader>gL",
      function()
        require("snacks.picker").git_log_line()
      end,
      desc = "[G]it Log [L]ine",
    },
    {
      "<leader>gs",
      function()
        require("snacks.picker").git_status()
      end,
      desc = "[G]it [S]tatus",
    },
    {
      "<leader>gS",
      function()
        require("snacks.picker").git_stash()
      end,
      desc = "[G]it [S]tash",
    },
    {
      "<leader>gd",
      function()
        require("snacks.picker").git_diff()
      end,
      desc = "[G]it [D]iff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        require("snacks.picker").git_log_file()
      end,
      desc = "[G]it Log [F]ile",
    },
    -- Grep
    {
      "<leader>sB",
      function()
        require("snacks.picker").grep_buffers()
      end,
      desc = "[S]earch Grep Open [B]uffers",
    },
    {
      "<leader>sg",
      function()
        require("snacks.picker").grep()
      end,
      desc = "[S]earch [G]rep",
    },
    {
      "<leader>sw",
      function()
        require("snacks.picker").grep_word()
      end,
      desc = "[S]earch Visual selection or [W]ord",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        require("snacks.picker").registers()
      end,
      desc = "[S]earch Registers",
    },
    {
      "<leader>s/",
      function()
        require("snacks.picker").search_history()
      end,
      desc = "[S]earch History",
    },
    {
      "<leader>sa",
      function()
        require("snacks.picker").autocmds()
      end,
      desc = "[S]earch [A]utocmds",
    },
    {
      "<leader>sc",
      function()
        require("snacks.picker").command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        require("snacks.picker").commands()
      end,
      desc = "[S] [C]ommands",
    },
    {
      "<leader>sd",
      function()
        require("snacks.picker").diagnostics()
      end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>sD",
      function()
        require("snacks.picker").diagnostics_buffer()
      end,
      desc = "[S]earch Buffer [D]iagnostics",
    },
    {
      "<leader>sh",
      function()
        require("snacks.picker").help()
      end,
      desc = "[S]earch [H]elp Pages",
    },
    {
      "<leader>sH",
      function()
        require("snacks.picker").highlights()
      end,
      desc = "[S]earch [H]ighlights",
    },
    {
      "<leader>si",
      function()
        require("snacks.picker").icons()
      end,
      desc = "[S]earch [I]cons",
    },
    {
      "<leader>sj",
      function()
        require("snacks.picker").jumps()
      end,
      desc = "[S]earch [J]umps",
    },
    {
      "<leader>sk",
      function()
        require("snacks.picker").keymaps()
      end,
      desc = "[S]earch [K]eymaps",
    },
    {
      "<leader>sl",
      function()
        require("snacks.picker").loclist()
      end,
      desc = "[S]earch [L]ocation List",
    },
    {
      "<leader>sm",
      function()
        require("snacks.picker").marks()
      end,
      desc = "[S]earch [M]arks",
    },
    {
      "<leader>sM",
      function()
        require("snacks.picker").man()
      end,
      desc = "[S]earch [M]an Pages",
    },
    {
      "<leader>sp",
      function()
        require("snacks.picker").lazy()
      end,
      desc = "[S]earch for [P]lugin Spec",
    },
    {
      "<leader>sq",
      function()
        require("snacks.picker").qflist()
      end,
      desc = "[S]earch [Q]uickfix List",
    },
    {
      "<leader>sR",
      function()
        require("snacks.picker").resume()
      end,
      desc = "[S]earch [R]esume",
    },
    {
      "<leader>su",
      function()
        require("snacks.picker").undo()
      end,
      desc = "[S]earch [U]ndo History",
    },
    {
      "<leader>uc",
      function()
        require("snacks.picker").colorschemes()
      end,
      desc = "[U]i [C]olorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        require("snacks.picker").lsp_definitions()
      end,
      desc = "[G]oto [D]efinition",
    },
    {
      "gD",
      function()
        require("snacks.picker").lsp_declarations()
      end,
      desc = "[G]oto [D]eclaration",
    },
    {
      "gr",
      function()
        require("snacks.picker").lsp_references()
      end,
      nowait = true,
      desc = "[G]oto [R]eferences",
    },
    {
      "gI",
      function()
        require("snacks.picker").lsp_implementations()
      end,
      desc = "[G]oto [I]mplementation",
    },
    {
      "gy",
      function()
        require("snacks.picker").lsp_type_definitions()
      end,
      desc = "[G]oto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        require("snacks.picker").lsp_symbols()
      end,
      desc = "[S]earch LSP [S]ymbols",
    },
    {
      "<leader>sS",
      function()
        require("snacks.picker").lsp_workspace_symbols()
      end,
      desc = "[S]earch LSP Workspace [S]ymbols",
    },
    -- notifications
    {
      "<leader>tn",
      function()
        require("snacks.notifier").hide()
      end,
      desc = "[T]oggle All [N]otifications",
    },
    -- terminal
    {
      "<c-/>",
      function()
        require("snacks.terminal").toggle(nil, { cwd = vim.uv.cwd() })
      end,
      desc = "Toggle terminal",
      mode = { "n", "t" },
    },
  },
}
