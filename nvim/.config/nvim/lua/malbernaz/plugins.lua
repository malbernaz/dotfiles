local fn = vim.fn

-- automatically install packer
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

local packer = require("packer")

packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/plenary.nvim")
    use("malbernaz/monokai.nvim")
    use("folke/tokyonight.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-telescope/telescope.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      requires = { "nvim-treesitter/playground" },
    })
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "onsails/lspkind-nvim",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
      },
    })
    use("neovim/nvim-lspconfig")
    use({
      "numToStr/Comment.nvim",
      requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
    })
    use("TimUntersberger/neogit")
    use("ur4ltz/surround.nvim")
    use("lewis6991/gitsigns.nvim")
    use("mhartington/formatter.nvim")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("akinsho/toggleterm.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("jxnblk/vim-mdx-js")
    use({ "folke/zen-mode.nvim", requires = { "folke/twilight.nvim" } })
    use("folke/trouble.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use({
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker" },
    })
    use("goolord/alpha-nvim")

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
})
