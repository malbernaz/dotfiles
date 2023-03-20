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
  "kyazdani42/nvim-web-devicons",
  "nvim-lua/plenary.nvim",
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope.nvim",

  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground",

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

  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  "TimUntersberger/neogit",
  "ur4ltz/surround.nvim",
  "lewis6991/gitsigns.nvim",
  "mhartington/formatter.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "akinsho/toggleterm.nvim",
  "jxnblk/vim-mdx-js",
  "folke/zen-mode.nvim",
  "folke/twilight.nvim",
  "folke/trouble.nvim",
  "lukas-reineke/indent-blankline.nvim",
  { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
  "MunifTanjim/nui.nvim",
  "s1n7ax/nvim-window-picker",
  "goolord/alpha-nvim",
  "fgheng/winbar.nvim",
})
