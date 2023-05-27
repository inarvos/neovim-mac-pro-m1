local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

local num_args = vim.api.nvim_eval(vim.api.nvim_exec('echo argc()', true))

if num_args == 0 then
  vim.api.nvim_exec('intro', false)
end

vim.cmd [[ packadd packer.nvim ]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.cmd([[ let g:vimspector_enable_mappings = 'HUMAN' ]])
vim.cmd([[ let g:vimspector_base_dir='/Users/inarvos/.share/nvim/site/pack/packer/start/vimspector']])
vim.cmd([[ packadd! vimspector ]])

packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  --Colorschemes plugins:
  --use {
    --'svrana/neosolarized.nvim',
    --requires = { 'tjdevries/colorbuddy.nvim' }
  --}
  use 'tjdevries/colorbuddy.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'cocopon/iceberg.vim'
  use 'folke/tokyonight.nvim'
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use 'bluz71/vim-moonfly-colors'

  --Devicons (tree):
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  --Lualine (line below code)
  use 'nvim-lualine/lualine.nvim'

  --Code help:
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'

  --TODO:
  --Code design:
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'MunifTanjim/prettier.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag' --TreeSitter required
  
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use { 'numToStr/Comment.nvim', -- ? TreeSitter required
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  --use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use { --"How to copy file path to clipboard?
  'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  } 
  use 'scrooloose/nerdtree'
  use 'scrooloose/nerdcommenter'
  use 'machakann/vim-highlightedyank'
  use 'davidhalter/jedi-vim'
  use 'Shougo/deoplete.nvim'
  use 'deoplete-plugins/deoplete-jedi'
  use 'neomake/neomake'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-fugitive'
  use 'majutsushi/tagbar'
  use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }
  use 'Shougo/neco-vim'
  use 'neoclide/coc-neco'
  use {
    'kevinhwang91/nvim-ufo',
      requires = {
        'kevinhwang91/promise-async',
        'luukvbaal/statuscol.nvim'
    }}
  use { 'puremourning/vimspector' }
  use { 'm4xshen/autoclose.nvim' }
  use { 'mfussenegger/nvim-dap' }
end)
