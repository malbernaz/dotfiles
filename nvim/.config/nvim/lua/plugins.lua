-- compile plugins whenever they are changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("Mofiqul/vscode.nvim")
  use("nvim-lua/lsp-status.nvim")
  use({
    "glepnir/galaxyline.nvim",
    branch = "main",
    config = function()
      require("settings/gl")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use("nvim-lua/plenary.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    config = require("settings.telescope"),
  })
  use("nvim-telescope/telescope-fzy-native.nvim")
  use({
    "kyazdani42/nvim-tree.lua",
    config = require("settings.tree"),
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = require("settings.treesitter"),
  })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/vim-vsnip",
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
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "numToStr/Comment.nvim",
    config = require("settings.comment"),
  })
  use("tpope/vim-surround")
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
end)
