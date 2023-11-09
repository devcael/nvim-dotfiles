vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim'  -- vscode-like pictograms
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }
  use 'L3MON4D3/LuaSnip'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Copilot
  use 'github/copilot.vim'

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Look And Feel

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use { "catppuccin/nvim", as = "catppuccin" }

  -- Productivity


  use 'honza/vim-snippets'               -- Exemplo do plugin vim-snippets
  use { "rafamadriz/friendly-snippets" } -- Exemplo de plugin

  --use {'akinsho/bufferline.nvim', tag = "*"}

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }

  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use 'nvim-lua/plenary.nvim'
  use 'mbbill/undotree'
  use 'ThePrimeagen/harpoon'

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use ''


  -- Language Servers

  use 'mfussenegger/nvim-jdtls'

  -- use {'neoclide/coc.nvim', branch = 'release'}



  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  use {
    "williamboman/nvim-lsp-installer",
  }

  -- Terminal Settings
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  -- Language Parser
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })


  use { "jose-elias-alvarez/null-ls.nvim" }

  -- Git Tools
  use 'tpope/vim-fugitive'


  -- Laguages Plugins

  -- Golang Setup

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support
end)
