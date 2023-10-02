local status, packer = pcall(require, "packer")

-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  --Coding:
  --mason.nvim
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'OmniSharp/omnisharp-vim'

  --Code design:
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  -- vim.opt.foldmethod     = 'expr'
  -- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
      vim.opt.foldmethod     = 'expr'
      vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    end
  })
  use 'nvim-treesitter/playground'
  
  --Trees:
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'scrooloose/nerdtree',
    requires = {
      'Xuyuanp/nerdtree-git-plugin',
      'ryanoasis/vim-devicons',
      'tiagofumo/vim-nerdtree-syntax-highlight',
      'scrooloose/nerdtree-project-plugin',
      'PhilRunninger/nerdtree-buffer-ops',
      'PhilRunninger/nerdtree-visual-selection'
    }
  }
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use {
  'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  } 
  --Devicons (tree):
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  --Colorschemes:
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
  use 'morhetz/gruvbox'
 
  --Lualine (line below code)
  use 'nvim-lualine/lualine.nvim'

  --Other
  use 'windwp/nvim-autopairs'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- using packer.nvim
  use 'numToStr/Comment.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'machakann/vim-highlightedyank'
  use 'neomake/neomake'
  use 'tpope/vim-fugitive'
end)
