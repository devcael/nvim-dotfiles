vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


 use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
    }


 use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
     {'williamboman/mason.nvim'},
     {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}

 use({ 'rose-pine/neovim', as = 'rose-pine' })

 use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

use { "catppuccin/nvim", as = "catppuccin" }

use 'mbbill/undotree'
use 'tpope/vim-fugitive'
use 'nvim-lua/plenary.nvim'
use 'ThePrimeagen/harpoon'

end)
