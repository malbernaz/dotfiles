-- compile plugins whenever they are changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lua/plenary.nvim")
  use({
    "tanvirtin/monokai.nvim",
    config = require("settings.monokai"),
  })
  use({
    "nvim-lualine/lualine.nvim",
    config = require("settings.lualine"),
  })
  use({
    "nvim-telescope/telescope.nvim",
    config = require("settings.telescope"),
    requires = { "nvim-telescope/telescope-fzy-native.nvim" },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = require("settings.treesitter"),
    requires = { "nvim-treesitter/playground" },
  })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/vim-vsnip",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = require("settings/cmp"),
  })
  use({
    "neovim/nvim-lspconfig",
    config = require("settings.lsp"),
    requires = { "tjdevries/nlua.nvim" },
  })
  use({
    "numToStr/Comment.nvim",
    config = require("settings.comment"),
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
  })
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-repeat")
  use({
    "tpope/vim-fugitive",
    config = require("settings.fugitive"),
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = require("settings.gitsigns"),
  })
  use({
    "mhartington/formatter.nvim",
    config = require("settings.formatter"),
  })
  use({
    "windwp/nvim-autopairs",
    config = require("settings.autopairs"),
  })
  use({
    "windwp/nvim-ts-autotag",
    config = require("settings.autotag"),
  })
  use({
    "akinsho/toggleterm.nvim",
    config = require("settings.toggleterm"),
  })
  use({
    "norcalli/nvim-colorizer.lua",
    config = require("settings.colorizer"),
  })
  use({
    "goolord/alpha-nvim",
    config = require("settings.startscreen"),
  })
  use("jxnblk/vim-mdx-js")
  use("mbbill/undotree")
  use({
    "folke/zen-mode.nvim",
    config = require("settings.zen-mode"),
    requires = { "folke/twilight.nvim" },
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = require("settings.blankline"),
  })
  use({
    "Xuyuanp/yanil",
    config = require("settings.filetree"),
  })
end)
