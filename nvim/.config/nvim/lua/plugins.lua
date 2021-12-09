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
    requires = {
      "nvim-telescope/telescope-fzy-native.nvim",
      "AckslD/nvim-neoclip.lua",
    },
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
      "f3fora/cmp-spell",
      "onsails/lspkind-nvim",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = require("settings/cmp"),
  })
  use({
    "neovim/nvim-lspconfig",
    config = require("settings.lsp"),
  })
  use({
    "numToStr/Comment.nvim",
    config = require("settings.comment"),
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
  })
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-repeat")
  use("tpope/vim-fugitive")
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
    after = { "nvim-lspconfig" },
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
    config = function()
      require("colorizer").setup({ "*" })
    end,
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
end)
