-- automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/lazy.nvim",

  -- treesitter
  "nvim-treesitter/nvim-treesitter",

  -- lsp
  { "VonHeikemen/lsp-zero.nvim", branch = "v1.x" },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- formatting
  "mhartington/formatter.nvim",

  -- comments
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- git
  "NeogitOrg/neogit",
  "lewis6991/gitsigns.nvim",

  -- styles
  "nvim-tree/nvim-web-devicons",
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "MunifTanjim/nui.nvim",
  "s1n7ax/nvim-window-picker",
  "goolord/alpha-nvim",
  "fgheng/winbar.nvim",

  -- misc
  { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "ur4ltz/surround.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "akinsho/toggleterm.nvim",
  "folke/trouble.nvim",
})
