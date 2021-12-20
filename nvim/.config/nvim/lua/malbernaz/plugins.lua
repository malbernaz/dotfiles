local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- compile plugins whenever they are changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/plenary.nvim")
    use({
      "tanvirtin/monokai.nvim",
      config = require("malbernaz.monokai"),
    })
    use({
      "nvim-lualine/lualine.nvim",
      config = require("malbernaz.lualine"),
    })
    use({
      "nvim-telescope/telescope.nvim",
      config = require("malbernaz.telescope"),
      requires = { "nvim-telescope/telescope-fzy-native.nvim" },
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = require("malbernaz.treesitter"),
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
      config = require("malbernaz/cmp"),
    })
    use({
      "neovim/nvim-lspconfig",
      config = require("malbernaz.lsp"),
      requires = { "tjdevries/nlua.nvim" },
    })
    use({
      "numToStr/Comment.nvim",
      config = require("malbernaz.comment"),
      requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
    })
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("tpope/vim-repeat")
    use({
      "tpope/vim-fugitive",
      config = require("malbernaz.fugitive"),
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = require("malbernaz.gitsigns"),
    })
    use({
      "mhartington/formatter.nvim",
      config = require("malbernaz.formatter"),
    })
    use({
      "windwp/nvim-autopairs",
      config = require("malbernaz.autopairs"),
    })
    use({
      "windwp/nvim-ts-autotag",
      config = require("malbernaz.autotag"),
    })
    use({
      "akinsho/toggleterm.nvim",
      config = require("malbernaz.toggleterm"),
    })
    use({
      "norcalli/nvim-colorizer.lua",
      config = require("malbernaz.colorizer"),
    })
    use({
      "goolord/alpha-nvim",
      config = require("malbernaz.startscreen"),
    })
    use("jxnblk/vim-mdx-js")
    use("mbbill/undotree")
    use({
      "folke/zen-mode.nvim",
      config = require("malbernaz.zen-mode"),
      requires = { "folke/twilight.nvim" },
    })
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = require("malbernaz.blankline"),
    })
    use({
      "Xuyuanp/yanil",
      config = require("malbernaz.filetree"),
    })

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
})
