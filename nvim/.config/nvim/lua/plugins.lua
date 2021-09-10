-- compile plugins whenever they are changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("tomasiser/vim-code-dark")
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
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = require("settings.treesitter"),
  })
  use({
    "neovim/nvim-lspconfig",
    config = require("settings.lsp"),
  })
  use("nvim-lua/completion-nvim")
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = { "nvim-treesitter" },
  })
  use({
    "b3nj5m1n/kommentary",
    config = require("settings.kommentary"),
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
  use("chrisbra/Colorizer")
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
    config = require("settings.toggleterm")
  })
end)
